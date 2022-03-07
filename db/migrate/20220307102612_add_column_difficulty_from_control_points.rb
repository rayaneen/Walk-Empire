class AddColumnDifficultyFromControlPoints < ActiveRecord::Migration[6.1]
  def change
    add_column :control_points, :difficulty, :integer
  end
end
