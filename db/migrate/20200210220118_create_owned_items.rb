class CreateOwnedItems < ActiveRecord::Migration[6.0]
  def change
    create_table :owned_items do |t|
      t.integer :user_id
      t.integer :supply_id
    end
  end
end
