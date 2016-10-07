json.extract! sharer, :id, :name, :email, :city, :created_at, :updated_at
json.url sharer_url(sharer, format: :json)