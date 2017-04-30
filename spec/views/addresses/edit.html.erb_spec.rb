require 'rails_helper'

RSpec.describe "addresses/edit", type: :view do

  before(:each) do
    @address = assign(:address, Address.create!(customer_id: "1", street_number: "134", street_name: "street", city: "city", country: "country", pincode: "123456"))
  end

  # it "renders the edit address form" do
  #   render
  #
  #   assert_select "form[action=?][method=?]", address_path(@address), "post" do
  #   end
  # end
end
