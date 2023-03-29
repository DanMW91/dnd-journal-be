module Mutations
  class CreateCharacter < Mutations::BaseMutation
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :bio, String, required: true
    argument :campaign_name, String, required: true
    argument :backstory, String, required: false
    argument :image_url, String, required: false
    argument :key_words, String, required: false

    field :character, Types::Model::CharacterType

    def resolve(first_name:, last_name:, bio:, campaign_name:, backstory:, image_url:, key_words:)
      campaign = context[:current_resource].campaigns.find_by(
        name: campaign_name
      )

      new_character = ''

      Character.transaction do
        new_character = Character.create!(
          first_name: first_name,
          last_name: last_name,
          bio: bio,
          backstory: backstory,
          user: context[:current_resource],
          campaign: campaign,
          image: image_url ? Image.new(url: image_url) : nil
        )

        all_key_words = key_words.split(', ')
        all_key_words << first_name
        new_character.create_key_words(key_word_array: all_key_words)
      end

        # Successful creation, return the created object with no errors
        { character: new_character }

    end
  end
end
