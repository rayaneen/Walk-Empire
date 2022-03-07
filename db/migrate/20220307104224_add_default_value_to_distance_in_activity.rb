class AddDefaultValueToDistanceInActivity < ActiveRecord::Migration[6.1]
  def change
    change_column :activities, :distance, :integer, default: 0
  end
end
