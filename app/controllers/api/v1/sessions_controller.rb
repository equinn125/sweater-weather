class Api::V1::SessionsController < ApplicationController

  def create
    found_user = User.find_by(email: params[:email].downcase)
    if !found_user.nil? && found_user.authenticate(params[:password])
      session[:user_id] = found_user.id
      render json: UsersSerializer.new(found_user), status: 200
    else
      render json:  {"error": "invalid_credentials"}, status: 400
    end
    # reset_session
  end
end
