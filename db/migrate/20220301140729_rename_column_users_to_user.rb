class RenameColumnUsersToUser < ActiveRecord::Migration[6.1]
  def change
    remove_reference :control_points, :users
    add_reference :control_points, :user
  end
end
