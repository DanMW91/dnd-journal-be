module Mutations
  class CreateTimelineEvent < Mutations::BaseMutation
    argument :write_up_id, ID, required: true
    argument :description, String, required: true
    argument :content, String, required: true
    argument :resource_name, String, required: false
    argument :resource_type, String, required: false
    argument :image_url, String, required: false
    argument :death, Boolean, required: true

    field :timeline_event, ID

    def resolve(write_up_id:, description:, content:, resource_name:, resource_type:, death:, image_url:)
      write_up = WriteUp.find(write_up_id)
      campaign = write_up.campaign

      resource = nil

      resource_type && resource = campaign.find_resource(
        resource_name: resource_name,
        resource_type: resource_type
      )

      image = image_url && Image.new(
        url: image_url
      )

      event = TimelineEvent.new(
        time_lineable: resource,
        write_up: write_up,
        description: description,
        content: content,
        death: death,
        event_type: resource_type.downcase || :general
      )

      event.image = image if image

      if event.save
        # Successful creation, return the created object with no errors
        { timeline_event: event.id }
      else
        # Failed save, return the errors to the client
        {
          timeline_event: nil
        }
      end
    end
  end
end
