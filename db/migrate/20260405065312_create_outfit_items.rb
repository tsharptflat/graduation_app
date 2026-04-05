class CreateOutfitItems < ActiveRecord::Migration[7.2]
  def change
    create_table :outfit_items do |t|
      t.string :name, null: false
      t.string :description
      t.string :image_path
      t.timestamps
    end

    add_index :outfit_items, :name, unique: true
  end
end
