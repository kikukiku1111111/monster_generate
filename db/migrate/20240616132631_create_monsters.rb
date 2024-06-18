class CreateMonsters < ActiveRecord::Migration[7.1]
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :type
      t.string :animal
      t.integer :color
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
