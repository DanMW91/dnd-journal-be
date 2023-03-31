class LocationMap < ApplicationRecord
  belongs_to :location
  has_one :image, as: :imageable, dependent: :destroy
  has_many :markers, dependent: :destroy
end
