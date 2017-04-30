require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(name: "ranjith", email: "ranjith@gmail.com", phonenumber: "0123456789"),
      Customer.create!(name: "ranjith", email: "ranjitsh@gmail.com", phonenumber: "0123456789")
    ])
  end

  # it "renders a list of customers" do
  #   render
  # end
end
