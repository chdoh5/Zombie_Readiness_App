class CreateSupplies < ActiveRecord::Migration[6.0]
  def change
    create_table :supplies do |t|
      t.string :name
      t.integer :readiness_value
    end
  end
end
