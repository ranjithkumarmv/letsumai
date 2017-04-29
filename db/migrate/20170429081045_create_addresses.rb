class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.string :street_number
      t.string :street_name
      t.integer :pincode
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
