json.extract! group_activity, :id, :amount, :date_done, :group_id, :activity_id, :observation, :user_id, :created_at, :updated_at
json.url group_activity_url(group_activity, format: :json)
