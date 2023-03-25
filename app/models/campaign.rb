class Campaign < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :key_words, dependent: :destroy
  has_many :characters, dependent: :destroy
  has_many :write_ups, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :quests, dependent: :destroy
  has_many :npcs, dependent: :destroy
  has_many :notable_groups, dependent: :destroy
  validates :name, presence: true
end
