class Sanction < ApplicationRecord
  belongs_to :event
  belongs_to :user
  protokoll :code, :pattern => "SANCTION%y%m#####"
end
