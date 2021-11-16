class Api::V1::UsersController<ApplicationController
  def create
   # user[:email] = user[:email].downcase
   new_user = User.new(user_params)
   if params[:email].nil? || params[:password].nil? || params[:password_confirmation].nil?
     render json:  {"error": "missing_field"}, status: 400
   elsif User.find_by(email: params[:email])
     render json:  {"error": "user_aready_exists"}, status: 400
   elsif params[:password] != params[:password_confirmation]
     render json:  {"error": "bad_request"}, status: 400
   elsif new_user.save
     session[:user_id] = new_user.id
    render json: UsersSerializer.new(new_user), status: 201
   else
     render json:  {"error": "bad_request"}, status: 400
   end
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
