class LoginUser < AuthenticateUser

  protected def command
    user = User.find_by_username(@username)
    if user && user.authenticate(@password)
      user
    else
      errors.add :user_authentication, 'invalid credentials'
      nil
    end
  end

end
