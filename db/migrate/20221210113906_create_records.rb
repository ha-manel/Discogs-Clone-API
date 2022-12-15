class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.string :title
      t.string :artist
      t.integer :year
      t.string :genre
      t.text :image_data

      t.timestamps
    end
  end
end
