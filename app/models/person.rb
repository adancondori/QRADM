class Person < ApplicationRecord
  belongs_to :group, optional: true
  belongs_to :event, optional: true
  protokoll :code, :pattern => "PERSON%y%m#####"
  after_create :add_event

  def add_event
    if self.group.present?
      self.event_id = self.group.event.id 
      self.save
    end
  end
end
