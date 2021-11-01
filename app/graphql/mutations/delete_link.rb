class Mutations::DeleteLink < Mutations::BaseMutation
  # argument :id, ID, required: true, loads: Types::LinkType, as: :link
  argument :id, ID, required: true

  field :link, Types::LinkType, null: true

  def resolve(id:)
    link = Link.find(id)
    link.delete()

    {
      link: link,
      errors: link.errors.full_messages
    }
  end
end 
