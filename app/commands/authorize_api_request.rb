class AuthorizeApiRequest

  prepend SimpleCommand

  # Parameters when the command is called
  def initialize(headers = {})
    @headers = headers
  end

  # Callback response
  def call
    command()
  end

  attr_reader :headers

  private def command
    if headers['Authorization'].present?
      http_auth_header = headers['Authorization'].split(' ').last
      decoded_auth_token = JsonWebToken::decode(http_auth_header)
      if decoded_auth_token.present?
        user = User.find_by_id(JsonWebToken::decode(http_auth_header)[:user_id])
        return user if user.present?
      end
      errors.add(:token, 'Invalid token')
    else
      errors.add(:token, 'Missing token')
    end
    nil
  end

end
