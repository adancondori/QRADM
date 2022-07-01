class PeopleSerializer < ActiveModel::Serializer
    attributes :id, :name, :last_name, :phone, :event_id, :group_id, :state, :code, :event, :group
    belongs_to :event
    belongs_to :group
end