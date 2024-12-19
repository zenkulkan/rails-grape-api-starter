# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  describe 'POST /api/v1/users' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          email: 'john@example.com',
          password: 'password123',
          password_confirmation: 'password123'
        }
      end

      it 'creates a new user' do
        post '/api/v1/users', params: valid_params
        expect(response).to have_http_status(:created)
      end

      it 'renders the created user and token' do
        post '/api/v1/users', params: valid_params
        expect(response).to have_http_status(:created)
        response_data = JSON.parse(response.body)['data']['attributes']
        expect(response_data['email']).to eq valid_params[:email]
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          email: 'john@example.com',
          password: 'password123',
          password_confirmation: '321password'
        }
      end

      it 'cannot create a new user' do
        post '/api/v1/users', params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
        response_data = JSON.parse(response.body)
        expect(response_data['error']).to eq(I18n.t('errors.users.invalid_params'))
      end
    end
  end
end
