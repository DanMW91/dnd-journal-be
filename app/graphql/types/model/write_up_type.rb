module Types
  module Model
    class WriteUpType < GraphQL::Schema::Object
      field :content, String, null: false
      field :session_number, ID, null: true
      field :title, String, null: false
      field :campaign, Types::Model::CampaignType, null: false
    end
  end
end
