class Person < ApplicationRecord
  belongs_to :group
  protokoll :code, :pattern => "PERSON%y%m#####"
end
