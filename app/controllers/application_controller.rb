# Authorizing requests
# To put the token to use,
# There must be a current_user method that will 'persist' the user.
# Implementation here because in order to have current_user available to all
# controllers which are inheriting from ApplicationController
class ApplicationController < ActionController::API

  # the server passes the request headers to AuthorizeApiRequest every time the user makes a request
  before_action :authenticate_request

  attr_reader :current_user

  # ActionController::Serialization dependency for serializing API Output
  include ActionController::Serialization

  private def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: :unauthorized unless @current_user
  end

end
