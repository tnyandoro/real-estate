class ApplicationController < ActionController::API
    include Tokenizable
  
    private
  
    def authenticate_user!
      token = request.headers['Authorization']&.split(' ')&.last
      decoded_token = decode_token(token)
      if decoded_token
        @current_user = User.find_by(id: decoded_token['user_id'])
      else
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end
end
