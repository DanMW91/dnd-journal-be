module Mutations
  class CreateQuest < Mutations::BaseMutation
    argument :title, String, required: true
    argument :description, String, required: true
    argument :reward, String, required: false
    argument :npc, String, required: false
    argument :location, String, required: false
    argument :campaign_name, String, required: true

    field :quest, Types::Model::QuestType

    def resolve(title:, description:, reward:, location:, campaign_name:, npc:)
      campaign = context[:current_resource].campaigns.find_by(
        name: campaign_name
      )
      quest_attribs = {campaign: campaign, title: title, description: description}

      npc = campaign.npcs.find_by(first_name: npc)
      location = campaign.locations.find_by(name: location)

      npc && quest_attribs[:npc] = npc
      location && quest_attribs[:location] = location
      reward && quest_attribs[:reward] = reward

      new_quest = Quest.new(
        quest_attribs
      )

      if new_quest.save
        new_quest.create_key_words(key_word_array: [title])
        # Successful creation, return the created object with no errors
        {quest: new_quest}
      else
        # Failed save, return the errors to the client
        {
          campaign: nil
        }
      end
    end
  end
end
