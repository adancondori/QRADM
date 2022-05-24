class SanctionSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :amount
end