json.extract! address, :id, :customer_id, :street_number, :street_name, :pincode, :city, :country, :created_at, :updated_at
json.url address_url(address, format: :json)
