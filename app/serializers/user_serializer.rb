class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :last_name, :type_role, :phone, :event_id, :state, :code, :email, :event
    belongs_to :event
end