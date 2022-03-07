class ChangeItinaryToActivities < ActiveRecord::Migration[6.1]
  def change
    change_column :activities, :itinary, :text
  end
end
