class Activity < ApplicationRecord
  belongs_to :event

  protokoll :code, :pattern => "ACTIVITY%y%m#####"
end
