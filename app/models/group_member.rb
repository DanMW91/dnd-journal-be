class GroupMember < ApplicationRecord
  belongs_to :notable_group
  belongs_to :group_memberable, polymorphic: true
end
