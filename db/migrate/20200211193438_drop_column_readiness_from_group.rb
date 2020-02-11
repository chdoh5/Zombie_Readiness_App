class DropColumnReadinessFromGroup < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :readiness_score
  end
end
