json.extract! event, :id, :name, :description, :code, :amount, :type_validation, :init_date, :end_date, :created_at, :updated_at
json.url event_url(event, format: :json)
