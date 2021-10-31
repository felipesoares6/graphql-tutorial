module Types
  class MutationType < Types::BaseObject
    field :create_link, mutation: Mutations::CreateLink
    field :update_link, mutation: Mutations::UpdateLink
  end
end
