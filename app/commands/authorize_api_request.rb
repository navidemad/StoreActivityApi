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
    # Assign @user if not already assigned
    # Find in database token if it set in header['Authorization']
    # Return User Object if found
    # Return nil if not found and add error message in ActiveModel::Errors
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || errors.add(:token, 'Invalid token') && nil
  end

  # Decodes the token received from http_auth_header and retrieves the user's ID
  private def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken::decode(http_auth_header)
  end

  # Extracts the token from the authorization header received in the class init
  private def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      errors.add(:token, 'Missing token')
    end
    nil
  end

end
