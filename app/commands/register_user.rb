class RegisterUser < AuthenticateUser

  protected def command
    user = User.find_by_username(@username)
    if user.nil?
      User.create(username: @username, password: @password, password_confirmation: @password)
    else
      errors.add :user_authentication, 'username is already taken'
      nil
    end
  end

end
