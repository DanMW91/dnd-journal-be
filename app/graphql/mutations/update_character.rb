module Mutations
  class UpdateCharacter < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :bio, String, required: true
    argument :campaign_name, String, required: true
    argument :backstory, String, required: false
    argument :image_url, String, required: false
    argument :key_words, String, required: false

    field :character, Types::Model::CharacterType

    def resolve(first_name:, last_name:, bio:, campaign_name:, image_url:, id:, key_words:, backstory:)
      campaign = context[:current_resource].campaigns.find_by(
        name: campaign_name
      )

      character = Character.find(id)
      character_attribs = {}
      first_name && character_attribs[:first_name] = first_name
      last_name && character_attribs[:last_name] = last_name
      bio && character_attribs[:bio] = bio
      backstory && character_attribs[:backstory] = backstory
      image_url && character_attribs[:image] = Image.new(url: image_url)

      Character.transaction do
        character.update!(
          character_attribs
        )

        all_key_words = key_words.split(', ')
        all_key_words << first_name
        character.create_key_words(key_word_array: all_key_words)
      end

        { character: character }
    end
  end
end
