module WebToken
  SECRET = Rails.application.secrets.secret_key_base
  EXPIRY = (Time.now + 1.week).to_i

  class << self

    def decode(token)
      JWT.decode(
        token,
        WebToken::SECRET,
        true, { algorithm: 'HS256' }
      ).first
    rescue JWT::ExpiredSignature
      :expired
    end

    def encode(mobile_user)
      JWT.encode(token_params(mobile_user), WebToken::SECRET, 'HS256')
    end

    private

    def token_params(mobile_user)
      {
        mobile_user_id: mobile_user.id,
        exp: EXPIRY
      }
    end
  end
end
