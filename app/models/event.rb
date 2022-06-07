class Event < ApplicationRecord
  protokoll :code, :pattern => "EVENT%y%m#####"
  has_many :groups
end
