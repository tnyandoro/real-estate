module Tokenizable
    extend ActiveSupport::Concern

    def encode_token(payload)
        JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def decode_token(token)
        begin
        JWT.decode(token, Rails.application.secrets.secret_key_base).first
        rescue JWT::DecodeError
        nil
        end
    end
end  