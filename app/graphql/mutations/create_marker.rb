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
      resource = campaign.find_resource(
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
  end
end
