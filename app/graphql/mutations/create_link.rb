class Mutations::CreateLink < Mutations::BaseMutation
  argument :url, String, required: true
  argument :description, String, required: true

  field :link, Types::LinkType, null: true

  def resolve(description: nil, url: nil)
    link = Link.create(
      url: url,
      description: description
    )

    {
      link: link,
      errors: link.errors.full_messages
    }
  end
end

