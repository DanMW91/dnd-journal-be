module Mutations
  class CreateMap < Mutations::BaseMutation
    argument :location_id, ID, required: true
    argument :url, String, required: true

    field :map_id, ID

    def resolve(location_id:, url:)
      location = Location.find(location_id)
      raise StandardError if location.location_map

      LocationMap.new(
        location: location,
        image: Image.new(url: url)
      )

      if location.save
        # Successful creation, return the created object with no errors
        {
          map_id: location.location_map.id
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
