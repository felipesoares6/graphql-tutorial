require 'test_helper'

class Types::QueryTypeTest < ActiveSupport::TestCase
  test 'list all the links' do
    query_string = <<-GRAPHQL
      {
        allLinks {
          id,
          url,
          description
        }
      }
    GRAPHQL

    result = GraphqlTutorialSchema.execute(query_string)

    links = result["data"]["allLinks"]
    first_link = result["data"]["allLinks"][0]
    second_link = result["data"]["allLinks"][1]

    assert_equal first_link["url"], 'test.com'
    assert_equal first_link["description"], 'test desc'
    assert_equal second_link["url"], 'test2.com'
    assert_equal second_link["description"], 'test desc 2'
  end

  test 'get one links' do
    query_string = <<-GRAPHQL
      query($id: ID!) {
        link(id: $id) {
          id,
          url,
          description
        }
      }
    GRAPHQL

    link_id = Link.first["id"]

    result = GraphqlTutorialSchema.execute(query_string, variables: { id: link_id })
   
    link = result["data"]["link"]

    assert_equal link["url"], 'test.com'
    assert_equal link["description"], 'test desc'
  end
end