json.extract! group_sanction, :id, :amount, :date_done, :group_id, :sanction_id, :user_id, :created_at, :updated_at
json.url group_sanction_url(group_sanction, format: :json)
