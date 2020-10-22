class Api::V1::HotelsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    render json: {
      is_success: true,
      data: { users: User.all }
    }, status: :ok
  end

  def show
    hotel = Hotel.find(params[:id])
    if hotel.present?

      render json: {
        is_success: true,
        data: { hotel: hotel }
      }, status: :ok
    else
      render json: {
        is_success: false,
        errors: 'Hotel not present with given ID'
      }, status: :ok
    end
  end

  def create
    hotel = Hotel.new(hotel_params)
    binding.pry
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


  private
  def hotel_params
    params.require(:hotel).permit(:name, :address)
  end
end
