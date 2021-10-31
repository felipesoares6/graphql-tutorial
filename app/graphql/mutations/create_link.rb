class Mutations::CreateLink < Mutations::BaseMutation
  argument :url, String, required: true
  argument :description, String, required: true

  type Types::LinkType

  def resolve(description: nil, url: nil)
    Link.create!(
      url: url,
      description: description
    )
  end
end

