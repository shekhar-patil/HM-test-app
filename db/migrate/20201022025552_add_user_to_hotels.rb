class AddUserToHotels < ActiveRecord::Migration[6.0]
  def change
    add_reference :hotels, :user
  end
end
