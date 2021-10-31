require 'test_helper'

class Mutations::CreateLinkTest < ActiveSupport::TestCase
  test 'create a new link' do
    mutation_string = <<-GRAPHQL
      mutation ($url: String!, $description: String!) {
        createLink (
          input: {
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

    result = GraphqlTutorialSchema.execute(mutation_string, variables: {
      url: 'test.com', description: 'test desc'
    })

    link = result["data"]["createLink"]["link"]

    assert_equal link["url"], 'test.com'
    assert_equal link["description"], 'test desc'
  end
end