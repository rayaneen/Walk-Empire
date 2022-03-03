class RemoveStepsFromActivities < ActiveRecord::Migration[6.1]
  def change
    remove_column :activities, :steps, :float
  end
end
