module Mutations
  class UpdateNotableGroup < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: true
    argument :description, String, required: true
    argument :characters, String, required: false
    argument :npcs, String, required: false
    argument :location, String, required: false
    argument :campaign_name, String, required: true

    field :notable_group, Types::Model::NotableGroupType

    def resolve(name:, description:, campaign_name:, characters:, npcs:, location:, id:)
      campaign = context[:current_resource].campaigns.find_by(
        name: campaign_name
      )

      notable_group = NotableGroup.find(id)

      group_attribs = {name: name, description: description}

      location && group_attribs[:location] = campaign.locations.find_by('LOWER(name)= ?', location)
      npcs_array = npcs.split(', ')
      characters_array = characters.split(', ')

      npcs = npcs_array.map do |npc|
        campaign.npcs.find_by('LOWER(first_name)= ?', npc.downcase)
      end

      character_objs = characters_array.map do |char|
        campaign.characters.find_by('LOWER(first_name)= ?', char.downcase)
      end

      character_objs.any? && group_attribs[:characters] = character_objs
      npcs.any? && group_attribs[:npcs] = npcs


      notable_group.update!(
        group_attribs
      )

      if notable_group.save
        # Successful creation, return the created object with no errors
        {notable_group: notable_group}
      else
        # Failed save, return the errors to the client
        {
          notable_group: nil
        }
      end
    end
  end
end
