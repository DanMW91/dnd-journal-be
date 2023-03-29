module Mutations
  class CreateNpc < Mutations::BaseMutation
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :description, String, required: true
    argument :campaign_name, String, required: true
    argument :image_url, String, required: false
    argument :key_words, String, required: false

    field :npc, Types::Model::NpcType

    def resolve(first_name:, last_name:, description:, campaign_name:, image_url:, key_words:)
      campaign = context[:current_resource].campaigns.find_by(
        name: campaign_name
      )

      new_npc = ''

      Npc.transaction do
        new_npc = Npc.create!(
          first_name: first_name,
          last_name: last_name,
          description: description,
          campaign: campaign,
          image: image_url ? Image.new(url: image_url) : nil
        )

        all_key_words = key_words.split(', ')
        all_key_words << first_name
        new_npc.create_key_words(key_word_array: all_key_words)
      end

        {npc: new_npc}
    end
  end
end
