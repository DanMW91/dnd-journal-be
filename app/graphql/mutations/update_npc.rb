module Mutations
  class UpdateNpc < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :description, String, required: true
    argument :campaign_name, String, required: true
    argument :image_url, String, required: false
    argument :key_words, String, required: false

    field :npc, Types::Model::NpcType

    def resolve(first_name:, last_name:, description:, campaign_name:, image_url:, id:, key_words:)
      campaign = context[:current_resource].campaigns.find_by(
        name: campaign_name
      )

      npc = Npc.find(id)
      npc_attribs = {}
      first_name && npc_attribs[:first_name] = first_name
      last_name && npc_attribs[:last_name] = last_name
      description && npc_attribs[:description] = description
      image_url && npc_attribs[:image] = Image.new(url: image_url)

      Npc.transaction do
        npc.update!(
          npc_attribs
        )

        all_key_words = key_words.split(', ')
        all_key_words << first_name
        npc.create_key_words(key_word_array: all_key_words)
      end

        { npc: npc }
    end
  end
end
