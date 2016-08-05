class AuthenticateUser

  prepend SimpleCommand

  # Parameters when the command is called
  def initialize(params)
    @username = params[:username]
    @password = params[:password]
  end

  # Callback response
  def call
    @user = command()
    JsonWebToken::encode(user_id: @user.id) if @user
  end

  attr_accessor :username, :password

  protected def command
    raise "command not found in inheriting class from AuthenticateUser"
  end

end
