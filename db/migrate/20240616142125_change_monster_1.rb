class ChangeMonster1 < ActiveRecord::Migration[7.1]
  def change
    change_column :monsters, :color, :string
    change_column :monsters, :type, :string
  end
end
