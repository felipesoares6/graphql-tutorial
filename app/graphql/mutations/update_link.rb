class Mutations::UpdateLink < Mutations::BaseMutation
  # argument :id, ID, required: true, loads: Types::LinkType, as: :link
  argument :id, ID, required: true
  argument :url, String, required: false
  argument :description, String, required: false

  field :link, Types::LinkType, null: true

  def resolve(id:, **args)
    link = Link.find(id)
    link.update(args)

    {
      link: link,
      errors: link.errors.full_messages
    }
  end
end
