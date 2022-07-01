class Sanction < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true
  protokoll :code, :pattern => "SANCTION%y%m#####"


  def name_amount
    "#{name} | #{amount}"
  end
end
