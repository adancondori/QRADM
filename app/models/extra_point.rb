class ExtraPoint < ApplicationRecord
  belongs_to :event
  protokoll :code, :pattern => "EXTRAPOINT%y%m#####"
end
