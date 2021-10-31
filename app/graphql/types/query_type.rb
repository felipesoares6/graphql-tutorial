module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :all_links, [LinkType], null: false
    field :link, LinkType, null: true do
      description "Find a link by the ID"
      argument :id, ID, required: true
    end

    def all_links
      Link.all
    end

    def link(id:)
      Link.find(id)
    end
  end
end
