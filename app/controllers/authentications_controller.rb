# Logging in users
class AuthenticationsController < ApplicationController
  skip_before_action :authenticate_request

  # Pass JSON params (username, password) to the LoginUser command
  # If the command succeeds, it will send the JWT token back to the user.
  def login
    handle LoginUser.call(authentication_params)
  end

  # Pass JSON params (username, password) to the RegisterUser command
  # If the command succeeds, it will send the JWT token back to the user.
  def register
    handle RegisterUser.call(authentication_params)
  end

  # handle response
  private def handle command
    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  # strong parameters for rating
  private def authentication_params
    params.require(:authentication).permit(:username, :password)
  end

end
