module Types
  class MutationType < Types::BaseObject
    field :create_link, mutation: Mutations::CreateLink
    field :update_link, mutation: Mutations::UpdateLink
    field :delete_link, mutation: Mutations::DeleteLink
  end
end
