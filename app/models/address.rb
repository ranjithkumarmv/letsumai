class Address < ApplicationRecord
  validates :customer_id, presence: true
  validates :street_number, :pincode, numericality: true , length: { minimum:1, maximum: 3 }, presence: true
  validates :pincode, numericality: true , length: { minimum:6, maximum: 6 }, presence: true
  validates :street_name, :city, :country, length: { maximum: 10 }, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  belongs_to :customer
end
