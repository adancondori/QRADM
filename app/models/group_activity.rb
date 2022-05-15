class GroupActivity < ApplicationRecord
  belongs_to :group
  belongs_to :activity
  belongs_to :user
end
