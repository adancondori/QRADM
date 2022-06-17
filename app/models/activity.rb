class Activity < ApplicationRecord
  belongs_to :event

  protokoll :code, :pattern => "ACTIVITY%y%m#####"

  def name_amount
    "#{name} | #{amount}"
  end
  
end
