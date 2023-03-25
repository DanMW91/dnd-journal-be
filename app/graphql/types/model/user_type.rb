module Types
  module Model
    class UserType < GraphQL::Schema::Object
      field :email, String, null: false
      field :campaigns, [Types::Model::CampaignType], null: true
    end
  end
end
