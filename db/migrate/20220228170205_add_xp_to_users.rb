class AddXpToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :xp, :integer
  end
end
