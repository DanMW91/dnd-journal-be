module Mutations
  class CreateNotableGroup < Mutations::BaseMutation
    argument :name, String, required: true
    argument :description, String, required: true
    argument :npcs, String, required: false
    argument :characters, String, required: false
    argument :location, String, required: false
    argument :campaign_name, String, required: true

    field :notable_group, Types::Model::NotableGroupType

    def resolve( # rubocop:disable Metrics/MethodLength, Metrics/AbcSize, Metrics/ParameterLists
      name:,
      description:,
      characters:,
      location:,
      campaign_name:,
      npcs:
    )
      campaign = context[:current_resource].campaigns.find_by(
        name: campaign_name
      )
      group_attribs = { campaign: campaign, name: name, description: description }

      npcs_array = npcs.split(', ')
      characters_array = characters.split(', ')

      npcs = npcs_array.map do |npc|
        campaign.npcs.find_by('LOWER(first_name)= ?', npc)
      end

      character_objs = characters_array.map do |char|
        campaign.characters.find_by('LOWER(first_name)= ?', char)
      end

      location = campaign.locations.find_by('LOWER(name)= ?', location)

      character_objs.any? && group_attribs[:characters] = character_objs
      npcs.any? && group_attribs[:npcs] = npcs
      location && group_attribs[:location] = location

      new_group = NotableGroup.new(
        group_attribs
      )

      if new_group.save
        new_group.create_key_words(key_word_array: [name])
        # Successful creation, return the created object with no errors
        { notable_group: new_group }
      else
        # Failed save, return the errors to the client
        {
          campaign: nil
        }
      end
    end
  end
end
