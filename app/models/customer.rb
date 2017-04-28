class Customer < ApplicationRecord
  validates :name, length: { maximum: 25 }, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, presence: true, length: { maximum: 25 }
  validates :phonenumber, numericality: true , length: { minimum:10, maximum: 10 }, presence: true
  validates :email, uniqueness: true
end
