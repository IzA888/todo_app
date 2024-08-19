# simple_jwt_auth/token_provider.rb
module SimpleJwtAuth
    class TokenProvider
      SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
  
      def call(payload)
        JWT.encode(payload, SECRET_KEY)
      end
  
      def self.decode(token)
        JWT.decode(token, SECRET_KEY)[0]
      rescue JWT::DecodeError
        nil
      end
    end
end  