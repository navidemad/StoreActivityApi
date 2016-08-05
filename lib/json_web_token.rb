module JsonWebToken

  # For authenticating the user and generate a token for him
  # Parameters:
  #   @string: the user id
  #   @ActiveSupport::Duration: the expiration time (30 days)
  def self.encode(payload, exp = 30.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  # To check if the user's token appended in each request is correct
  # Parameters:
  #   @JWT: the token generate by encode method above
  def self.decode(token)
    body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    HashWithIndifferentAccess.new body
  rescue
    nil
  end

end
