module Types
  module Model
    class MarkerType < GraphQL::Schema::Object
      field :id, ID, null: false
      field :offset_x, String, null: false
      field :offset_y, String, null: false
      field :markerable_type, String, null: false
      field :markerable_id, ID, null: false
    end
  end
end
