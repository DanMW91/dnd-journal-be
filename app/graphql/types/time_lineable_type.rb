module Types
  class TimeLineableType < Types::BaseUnion
    possible_types Types::Model::CharacterType,
                   Types::Model::NpcType,
                   Types::Model::QuestType,
                   Types::Model::LocationType

    def self.resolve_type(object, context)
      case object.class.name
      when 'Character'
        Types::Model::CharacterType
      when 'Npc'
        Types::Model::NpcType
      when 'Quest'
        Types::Model::QuestType
      when 'Location'
        Types::Model::LocationType
      end
    end
  end
end
