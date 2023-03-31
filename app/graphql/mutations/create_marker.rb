module Mutations
  class CreateMarker < Mutations::BaseMutation
    argument :map_id, ID, required: true
    argument :campaign_name, String, required: true
    argument :resource_type, String, required: true
    argument :resource_name, String, required: true
    argument :offset_x, String, required: true
    argument :offset_y, String, required: true

    field :marker, Types::Model::MarkerType

    def resolve(
      map_id:,
      campaign_name:,
      resource_type:,
      resource_name:,
      offset_x:,
      offset_y:
    )
      campaign = context[:current_resource].campaigns.find_by(name: campaign_name)
      resource = find_resource(
        campaign: campaign,
        resource_name: resource_name,
        resource_type: resource_type
      )

      location_map = LocationMap.find(map_id)

      marker = Marker.new(
        markerable: resource,
        offset_x: offset_x,
        offset_y: offset_y
      )

      location_map.markers << marker

      if location_map.save
        # Successful creation, return the created object with no errors
        {
          marker: marker
        }
      else
        # Failed save, return the errors to the client
        {
          map_id: nil
        }
      end
    end

    def find_resource(resource_type:, resource_name:, campaign:)
      lower_name = resource_name.downcase

      case resource_type
      when 'Character'
        campaign.characters.find_by('LOWER(first_name)= ?', lower_name)
      when 'Quest'
        campaign.quests.find_by('LOWER(title)= ?', lower_name)
      when 'Location'
        campaign.locations.find_by('LOWER(name)= ?', lower_name)
      when 'Npc'
        campaign.npcs.find_by('LOWER(first_name)= ?', lower_name)
      end
    end
  end
end
