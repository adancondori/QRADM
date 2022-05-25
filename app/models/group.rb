class Group < ApplicationRecord
  belongs_to :event
  has_many :group_activities
  has_many :group_sanctions
  has_many :group_extra_points

  def sum_group_activities
    group_activities.where("group_id <= ?", self.id).sum(:amount)
  end
  def sum_group_sanctions
    group_sanctions.where("group_id <= ?", self.id).sum(:amount)
  end
  def sum_group_extra_points
    group_extra_points.where("group_id <= ?", self.id).sum(:amount)
  end

  def sum_total
    sum_group_activities - sum_group_sanctions + sum_group_extra_points
  end
end
