module Types
  class MutationType < Types::BaseObject
    field_class GraphqlDevise::Types::BaseField

    field :create_campaign, mutation: Mutations::CreateCampaign
    field :create_character, mutation: Mutations::CreateCharacter
    field :update_character, mutation: Mutations::UpdateCharacter
    field :create_write_up, mutation: Mutations::CreateWriteUp
    field :create_npc, mutation: Mutations::CreateNpc
    field :update_npc, mutation: Mutations::UpdateNpc
    field :create_quest, mutation: Mutations::CreateQuest
    field :update_quest, mutation: Mutations::UpdateQuest
    field :create_location, mutation: Mutations::CreateLocation
    field :create_notable_group, mutation: Mutations::CreateNotableGroup
    field :update_notable_group, mutation: Mutations::UpdateNotableGroup
    field :create_s3_urls, mutation: Mutations::CreateS3Urls
  end
end
