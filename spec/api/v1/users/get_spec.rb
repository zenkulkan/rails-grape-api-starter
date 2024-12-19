# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  describe 'GET /api/v1/users' do
    let!(:users) { create_list(:user, 3) }

    context 'when authenticated as an admin' do
      let(:admin) { create(:user, :admin) }
      let(:token) { Users::TokenService.generate_token_for_user(admin) }

      it 'returns a list of users' do
        get '/api/v1/users', headers: { 'Authorization' => "Bearer #{token}" }
        expect(response).to be_successful

        expect(JSON.parse(response.body)['data'].size).to eq(User.all.count)
      end
    end

    context 'when authenticated as a regular user' do
      let(:user) { create(:user) }
      let(:token) { Users::TokenService.generate_token_for_user(user) }

      it 'returns an unauthorized error' do
        get '/api/v1/users', headers: { 'Authorization' => "Bearer #{token}" }
        expect(response).to have_http_status(:forbidden) # 403 Forbidden
      end
    end

    context 'when not authenticated' do
      it 'returns an unauthorized error' do
        get '/api/v1/users'
        expect(response).to have_http_status(:unauthorized) # 401 Unauthorized
      end
    end
  end

  describe 'GET /api/v1/users/me' do
    context 'when authenticated as an admin' do
      let(:admin) { create(:user) }
      let(:token) { Users::TokenService.generate_token_for_user(admin) }

      it 'returns data of requested user' do
        get '/api/v1/users/me', headers: { 'Authorization' => "Bearer #{token}" }
        expect(response).to be_successful
        expect(JSON.parse(response.body)['data']['id'].to_i).to eq(admin.id)
      end
    end

    context 'when authenticated as a regular user' do
      let(:user) { create(:user) }
      let(:token) { Users::TokenService.generate_token_for_user(user) }

      it 'returns data of requested user' do
        get '/api/v1/users/me', headers: { 'Authorization' => "Bearer #{token}" }
        expect(response).to be_successful
        expect(JSON.parse(response.body)['data']['id'].to_i).to eq(user.id)
      end
    end

    context 'when not authenticated' do
      it 'returns an unauthorized error' do
        get '/api/v1/users/me'
        expect(response).to have_http_status(:unauthorized) # 401 Unauthorized
      end
    end
  end
end
