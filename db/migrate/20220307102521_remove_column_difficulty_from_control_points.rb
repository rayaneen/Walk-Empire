class RemoveColumnDifficultyFromControlPoints < ActiveRecord::Migration[6.1]
  def change
    remove_column :control_points, :difficulty
  end
end
