json.extract! activity, :id, :name, :description, :rules, :code, :date_init, :date_end, :amount, :is_close, :state, :is_visible, :event_id, :created_at, :updated_at
json.url activity_url(activity, format: :json)
