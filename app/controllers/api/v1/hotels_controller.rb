class Api::V1::HotelsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :valid_user, only: :create

  def index
    render json: {
      is_success: true,
      data: { users: User.all }
    }, status: :ok
  end

  def show
    hotel = Hotel.find(params[:id])
    if hotel.present?
      rooms = hotel.rooms
      data = { hotel: hotel }
      data[:number_of_rooms] = rooms.count

      render json: {
        is_success: true,
        data: data
      }, status: :ok
    else
      render json: {
        is_success: false,
        errors: 'Hotel not present with given ID'
      }, status: :ok
    end
  end

  def create
    hotel = current_user.hotels.new(hotel_params)
    if hotel.save
      render json: {
        is_success: true,
        data: { hotel: hotel }
      }, status: :ok
    else
      render json: {
        is_success: false,
        errors: hotel.errors.full_messages
      }, status: :ok
    end
  end

  def add_room

  end


  private

  def hotel_params
    params.require(:hotel).permit(:name, :address)
  end

  def valid_user
    unless current_user.department == 'partner'
      return (render json: {
        is_success: false,
        errors: 'You are not a Partner to create hotel'
      }, status: :ok)
    end
  end
end
