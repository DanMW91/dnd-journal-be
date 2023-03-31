class Marker < ApplicationRecord
  belongs_to :map
  belongs_to :markerable, polymorphic: true
end
