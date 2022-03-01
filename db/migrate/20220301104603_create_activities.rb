class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :statut
      t.float :steps
      t.references :user, null: false, foreign_key: true
      t.references :controlpoint, null: false, foreign_key: true

      t.timestamps
    end
  end
end
