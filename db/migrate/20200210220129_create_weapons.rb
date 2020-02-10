class CreateWeapons < ActiveRecord::Migration[6.0]
  def change
    create_table :weapons do |t|
      t.string :name
      t.string :user_id
      t.integer :readiness_value
    end
  end
end
