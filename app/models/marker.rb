class Marker < ApplicationRecord
  belongs_to :location_map
  belongs_to :markerable, polymorphic: true
end
