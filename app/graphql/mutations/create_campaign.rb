module Mutations
  class CreateCampaign < Mutations::BaseMutation
    argument :name, String

    field :campaign, Types::Model::CampaignType

    def resolve(name:)
      new_campaign = Campaign.new(name: name)
      new_campaign.users << context[:current_resource]

      if new_campaign.save
        # Successful creation, return the created object with no errors
        {
          campaign: new_campaign
        }
      else
        # Failed save, return the errors to the client
        {
          campaign: nil
        }
      end
    end
  end
end
