class GroupSerializer < ActiveModel::Serializer
    attributes :id, :name, :code, :state, :description
end