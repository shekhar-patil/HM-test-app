class UserHotel < ApplicationRecord
  belongs_to :user
  belongs_to :hotel, optional: true
end
