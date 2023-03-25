module Types
  module Model
    class KeyWordType < GraphQL::Schema::Object
      field :key_word, String, null: true
      field :campaign_id, ID, null: true
      field :key_wordable_type, String, null: true
      field :key_wordable_id, ID, null: true
    end
  end
end
