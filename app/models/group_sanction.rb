class GroupSanction < ApplicationRecord
  belongs_to :group
  belongs_to :sanction
  belongs_to :user
end
