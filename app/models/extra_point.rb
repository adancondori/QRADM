class ExtraPoint < ApplicationRecord
  belongs_to :event
  protokoll :code, :pattern => "EXTRAPOINT%y%m#####"
  
  def name_amount
    "#{name} | #{amount}"
  end

end
