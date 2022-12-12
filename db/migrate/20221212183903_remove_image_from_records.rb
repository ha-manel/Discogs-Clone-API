class RemoveImageFromRecords < ActiveRecord::Migration[7.0]
  def change
    remove_column :records, :image_data
  end
end
