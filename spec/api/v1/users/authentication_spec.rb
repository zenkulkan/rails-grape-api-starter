# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  describe 'POST /api/v1/users/sign_in' do
    let(:user) { create(:user) }

    context 'with valid credentials' do
      let(:valid_params) do
        {
          email: user.email,
          password: user.password
        }
      end

      it 'returns a successful response with a token' do
        post '/api/v1/users/sign_in', params: valid_params
        expect(response).to be_successful
        expect(JSON.parse(response.body)).to have_key('token')
      end
    end

    context 'with invalid credentials' do
      let(:invalid_params) do
        {
          email: user.email,
          password: 'wrong_password'
        }
      end

      it 'returns an unauthorized error' do
        post '/api/v1/users/sign_in', params: invalid_params
        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)).to have_key('error')
      end
    end
  end
end
