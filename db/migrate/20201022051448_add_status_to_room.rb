class AddStatusToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :status, :integer, default: 0
  end
end
