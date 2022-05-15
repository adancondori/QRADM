json.extract! sanction, :id, :amount, :name, :description, :event_id, :user_id, :created_at, :updated_at
json.url sanction_url(sanction, format: :json)
