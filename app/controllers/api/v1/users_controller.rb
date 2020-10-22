class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: {
      is_success: true,
      data: { users: User.all }
    }, status: :ok
  end
end
