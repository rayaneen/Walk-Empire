class AddItinaryToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :itinary, :text, array: true, default: []
  end
end
