class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :introduction, null: false
      t.integer :price, null: false
      t.boolean :is_active, default: true, null: false
      t.timestamps
    end
  end
end
