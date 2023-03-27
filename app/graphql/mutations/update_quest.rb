module Mutations
  class UpdateQuest < Mutations::BaseMutation
    argument :quest_id, ID, required: true
    argument :description, String, required: false
    argument :reward, String, required: false
    argument :npc, String, required: false
    argument :complete, Boolean, required: false
    argument :location, String, required: false

    field :quest, Types::Model::QuestType

    def resolve(quest_id:, description:, reward:, location:, complete:, npc:)
      quest = Quest.find(quest_id)
      campaign = quest.campaign
      quest_attribs = {}

      npc = campaign.npcs.find_by('LOWER(first_name)= ?', npc.downcase)

      location = campaign.locations.find_by('LOWER(name)= ?', location)

      description && quest_attribs[:description] = description
      npc && quest_attribs[:npc] = npc
      location && quest_attribs[:location] = location
      reward && quest_attribs[:reward] = reward
      complete && quest_attribs[:complete] = complete

      quest.update(
        quest_attribs
      )

      if quest.save
        # Successful creation, return the created object with no errors
        {quest: quest}
      else
        # Failed save, return the errors to the client
        {
          quest: nil
        }
      end
    end
  end
end
