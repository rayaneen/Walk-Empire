class CreateControlPoints < ActiveRecord::Migration[6.1]
  def change
    create_table :control_points do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :status
      t.string :difficulty
      t.date :capture_date
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
