class AddDeletedAtToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :deleted_at, :datetime
  end
end
