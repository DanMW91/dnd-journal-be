module Mutations
  class CreateCharacter < Mutations::BaseMutation
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :bio, String, required: true
    argument :campaign_name, String, required: true
    argument :backstory, String, required: false
    argument :image_url, String, required: false

    field :character, Types::Model::CharacterType

    def resolve(first_name:, last_name:, bio:, campaign_name:, backstory:, image_url:)
      campaign = context[:current_resource].campaigns.find_by(
        name: campaign_name
      )

      new_character = Character.new(
        first_name: first_name,
        last_name: last_name,
        bio: bio,
        backstory: backstory,
        user: context[:current_resource],
        campaign: campaign,
        image: image_url ? Image.new(url: image_url) : nil
      )


      if new_character.save
        # Successful creation, return the created object with no errors
        {character: new_character}
      else
        # Failed save, return the errors to the client
        {
          campaign: nil
        }
      end
    end
  end
end
