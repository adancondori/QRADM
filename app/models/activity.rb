class Activity < ApplicationRecord
  belongs_to :event
  scope :visible, ->{where(is_visible: true)}

  protokoll :code, :pattern => "ACTIVITY%y%m#####"

  def name_amount
    "#{name} | #{amount}"
  end
  
end
