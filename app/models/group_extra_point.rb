class GroupExtraPoint < ApplicationRecord
  belongs_to :group
  belongs_to :extra_point
  belongs_to :user
end
