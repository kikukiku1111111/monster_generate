class RenameType < ActiveRecord::Migration[7.1]
  def change
    rename_column :monsters, :type, :attribution
  end
end
