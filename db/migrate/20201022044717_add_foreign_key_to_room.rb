class AddForeignKeyToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :hotel_id, :integer
  end
end
