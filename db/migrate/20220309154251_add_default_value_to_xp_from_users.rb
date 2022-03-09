class AddDefaultValueToXpFromUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :xp, :integer, default: 0
  end
end
