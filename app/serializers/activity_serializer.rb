class ActivitySerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :rules, :code, :init_date, :end_date, :amount, :is_closed, :state, :is_visible
end