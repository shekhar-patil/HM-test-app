class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer :floor
      t.string :number

      t.timestamps
    end
  end
end
