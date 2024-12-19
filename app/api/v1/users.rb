# frozen_string_literal: true

module V1
  class Users < Grape::API
    resource :users do
      desc 'Sign in a user and return a JWT token'
      params do
        requires :email, type: String, desc: 'User email'
        requires :password, type: String, desc: 'User password'
      end
      post :sign_in do
        user = User.find_by(email: params[:email])
        if user&.valid_password?(params[:password])
          token = ::Users::TokenService.generate_token_for_user(user)
          render({ token: token })
        else
          error!('Unauthorized', 401)
        end
      end

      desc 'Get a list of users'
      params do
        optional :role, type: String, desc: 'Filter users by role (e.g., "admin")'
        optional :pagination, type: Hash do
          optional :page, type: Integer, default: 1, desc: 'Page number (default: 1)' # Remove if not using pagination
          optional :per_page, type: Integer, default: 25, desc: 'Number of users per page (default: 25)' # Remove if not using pagination
        end
      end
      get do
        # authenticate
        authenticate!
        users, total = UsersQuery.call(params: params)
        # authorize user action to the data
        authorize(users, :index?)
        # pass total into pagination meta service to avoid calling object.total_count that will cost DB operations
        serialized_users = serialized_to_json(users, { meta: meta(users, total) })

        render(serialized_users)
      end

      desc 'Create a new user'
      params do
        requires :email, type: String, desc: 'User email'
        requires :password, type: String, desc: 'Password'
      end
      post do
        # Use the service object
        user = ::Users::RegistrationService.call(params)
        render(serialized_to_json(user))
      end

      desc 'Get the current user\'s information'
      get :me do
        authenticate! # Require authentication
        render(serialized_to_json(current_user))
      end
    end
  end
end
