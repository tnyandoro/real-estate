class Api::AuthenticationController < ApplicationController
    before_action :authenticate_user!, except: :login
  
    def login
      user = User.find_by(email: params[:email])
  
      if user&.valid_password?(params[:password])
        render json: { token: encode_token({ user_id: user.id }) }
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    private
  
    def authenticate_user!
      token = request.headers['Authorization']&.split(' ')&.last
      unless decode_token(token)
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end
end 