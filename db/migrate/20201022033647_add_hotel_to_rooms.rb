class AddHotelToRooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :rooms, :hotels
  end
end
