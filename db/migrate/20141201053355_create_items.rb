class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :list_id
      t.string :name
      t.string :url
      t.integer :price
      t.boolean :marked
      t.integer :marker_id

      t.timestamps
    end
  end
end
