module Mutations
  class UpdateNpc < Mutations::BaseMutation
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :description, String, required: true
    argument :campaign_name, String, required: true
    argument :image_url, String, required: false

    field :npc, Types::Model::NpcType

    def resolve(first_name:, last_name:, description:, campaign_name:, image_url:)
      campaign = context[:current_resource].campaigns.find_by(
        name: campaign_name
      )

      npc = campaign.npcs.find_by(first_name: first_name)
      npc_attribs = {}
      first_name && npc_attribs[:first_name] = first_name
      last_name && npc_attribs[:last_name] = last_name
      description && npc_attribs[:description] = description
      image_url && npc_attribs[:image] = Image.new(url: image_url)

      npc.update(
        npc_attribs
      )

      if npc.save
        # Successful creation, return the created object with no errors
        {npc: npc}
      else
        # Failed save, return the errors to the client
        {
          npc: nil
        }
      end
    end
  end
end
