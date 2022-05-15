json.extract! user, :id, :name, :last_name, :type_role, :phone, :state, :code, :event_id, :created_at, :updated_at
json.url user_url(user, format: :json)
