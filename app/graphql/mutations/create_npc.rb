module Mutations
  class CreateNpc < Mutations::BaseMutation
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

      new_npc = Npc.new(
        first_name: first_name,
        last_name: last_name,
        description: description,
        campaign: campaign,
        image: image_url ? Image.new(url: image_url) : nil
      )

      if new_npc.save
        # Successful creation, return the created object with no errors
        {npc: new_npc}
      else
        # Failed save, return the errors to the client
        {
          campaign: nil
        }
      end
    end
  end
end
