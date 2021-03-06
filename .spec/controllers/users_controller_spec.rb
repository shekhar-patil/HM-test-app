require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'GET/' do
    login_user

    context 'user controller' do
      it 'user#index' do
        get :index

        expect(response).to have_http_status(:success)
      end
    end
  end
end
