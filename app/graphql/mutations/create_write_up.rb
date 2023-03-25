module Mutations
  class CreateWriteUp < Mutations::BaseMutation
    argument :campaign_name, String, required: true
    argument :session, Int, required: true
    argument :title, String, required: true
    argument :content, String, required: true

    field :write_up, Types::Model::WriteUpType

    def resolve(session:, title:, content:, campaign_name:)
      campaign = context[:current_resource].campaigns.find_by(
        name: campaign_name
      )

      write_up = WriteUp.new(
        content: content,
        session_number: session,
        title: title,
        campaign: campaign
      )


      if write_up.save
        # Successful creation, return the created object with no errors
        {write_up: write_up}
      else
        # Failed save, return the errors to the client
        {
          write_up: nil
        }
      end
    end
  end
end
