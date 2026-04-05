class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :steam_id, null: false
      t.timestamps
    end

    add_index :users, :steam_id, unique: true
  end
end