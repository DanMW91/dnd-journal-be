class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  def self.s3_urls_for(file_name:, resource_type:)
    random_path = SecureRandom.uuid
    key = "uploads/#{resource_type}/#{random_path}/#{file_name}"

    signer = Aws::S3::Presigner.new
    post_url = signer.presigned_url(:put_object, bucket: 'dnd-journal-2', key: key)
    get_url = "https://dnd-journal-2.s3.eu-west-2.amazonaws.com/#{key}"

    {
      post_url: post_url,
      get_url: get_url
    }
  end
end
