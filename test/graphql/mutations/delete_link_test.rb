require 'test_helper'

class Mutations::DeleteLinkTest < ActiveSupport::TestCase
  test 'delete a link' do
    mutation_string = <<-GRAPHQL
      mutation ($id: ID!) {
        deleteLink (
          input: {
            id: $id
          }
        ) {
            link {
              id,
              url,
              description
            }
        }
      }
    GRAPHQL

    link_id = Link.first["id"]

    result = GraphqlTutorialSchema.execute(mutation_string, variables: {
      id: link_id
    })

    deleted_link = result["data"]["deleteLink"]["link"]
    not_found_link = Link.where(["id = :id", { id: link_id.to_s }])

    assert_equal deleted_link["url"], 'test.com'
    assert_equal deleted_link["description"], 'test desc'
    assert_equal not_found_link.length, 0
  end
end