class EventSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :code, :amount, :type_validation, :init_date, :end_date
end