json.extract! user, :id, :name, :email, :zip, :country, :date_of_birth, :password_digest, :created_at, :updated_at
json.url user_url(user, format: :json)