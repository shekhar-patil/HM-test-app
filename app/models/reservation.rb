class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :from_date, presence: true
  validates :to_date, presence: true
end
