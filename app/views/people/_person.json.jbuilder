json.extract! person, :id, :name, :last_name, :phone, :code, :state, :group_id, :event, :created_at, :updated_at
json.url person_url(person, format: :json)
