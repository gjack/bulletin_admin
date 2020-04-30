json.extract! subscriber, :id, :first_name, :last_name, :created_at, :updated_at
json.url subscriber_url(subscriber, format: :json)
