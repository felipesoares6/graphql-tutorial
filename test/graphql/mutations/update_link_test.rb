require 'test_helper'

class Mutations::UpdateLinkTest < ActiveSupport::TestCase
  test 'update a new link' do
    mutation_string = <<-GRAPHQL
      mutation ($id: ID! $url: String, $description: String) {
        updateLink (
          input: {
            id: $id,
            url: $url,
            description: $description
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
      id: link_id, url: 'testupdated.com', description: 'test desc updated'
    })

    link = result["data"]["updateLink"]["link"]

    assert_equal link["url"], 'testupdated.com'
    assert_equal link["description"], 'test desc updated'
  end
end