module Mutations
  class CreateS3Urls < Mutations::BaseMutation
    argument :file_name, String, required: true
    argument :resource_type, String, required: true

    field :post_url, String
    field :get_url, String

    def resolve(file_name:, resource_type:)
      ::Image.s3_urls_for(file_name: file_name, resource_type: resource_type)
    end
  end
end
