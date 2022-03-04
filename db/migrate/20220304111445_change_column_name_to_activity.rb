class ChangeColumnNameToActivity < ActiveRecord::Migration[6.1]
  def change
    rename_column :activities, :statut, :status
  end
end
