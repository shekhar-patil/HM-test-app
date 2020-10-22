class Room < ApplicationRecord
  enum status: %i[available booked]

  belongs_to :hotel
  has_many :reservations
  has_many :users, through: :reservations
end
