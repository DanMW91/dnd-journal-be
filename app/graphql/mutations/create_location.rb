module Mutations
  class CreateLocation < Mutations::BaseMutation
    argument :name, String, required: true
    argument :description, String, required: true
    argument :campaign_name, String, required: true

    field :location, Types::Model::LocationType

    def resolve(name:, description:, campaign_name:)
      campaign = context[:current_resource].campaigns.find_by(
        name: campaign_name
      )

      new_location = Location.new(
        name: name,
        description: description,
        campaign: campaign
      )


      if new_location.save
        new_location.create_key_words(key_word_array: [name])
        # Successful creation, return the created object with no errors
        {location: new_location}
      else
        # Failed save, return the errors to the client
        {
          location: nil
        }
      end
    end
  end
end
