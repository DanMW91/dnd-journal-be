module Types
  module Model
    class CampaignType < GraphQL::Schema::Object
      field :id, ID, null: false
      field :name, String, null: true
      field :users, [Types::Model::UserType], null: false
    end
  end
end
