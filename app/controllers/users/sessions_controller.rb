# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    # super
    # Fetch params
    email = params[:session][:user][:email] if params[:session]
    password = params[:session][:user][:password] if params[:session]

    id = User.find_by(email: email).try(:id) if email.presence

    if email == "" or password == ""
      render status: 400, json: { message: 'The request MUST contain the user email and password.' }
      return
    end

    # Authentication
    user = User.find_by(email: email)

    if user
      if user.valid_password? password
        # Note that the data which should be returned depends heavily of the API client needs.
        render status: 200, json: { user: user }
      else
        render status: 401, json: { message: 'Invalid email or password.' }
      end
    else
      render status: 401, json: { message: 'Invalid email or password.' }
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
