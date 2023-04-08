class Campaign < ApplicationRecord
  include StringStrippable

  has_and_belongs_to_many :users
  has_many :key_words, dependent: :destroy
  has_many :characters, dependent: :destroy
  has_many :write_ups, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :quests, dependent: :destroy
  has_many :npcs, dependent: :destroy
  has_many :notable_groups, dependent: :destroy
  validates :name, presence: true

  def find_resource(resource_type:, resource_name:)
    lower_name = resource_name.downcase

    case resource_type
    when 'Character'
      characters.find_by('LOWER(first_name)= ?', lower_name)
    when 'Quest'
      quests.find_by('LOWER(title)= ?', lower_name)
    when 'Location'
      locations.find_by('LOWER(name)= ?', lower_name)
    when 'Npc'
      npcs.find_by('LOWER(first_name)= ?', lower_name)
    end
  end
end
