# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionFix
  respond_to :json
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    email = params[:registration][:user][:email] if params[:registration]
    password = params[:registration][:user][:password] if params[:registration]
    confirm_password = params[:registration][:user][:confirm_password] if params[:registration]
    # id = User.find_by(email: email).try(:id) if email.presence

    if email == "" or password == "" or confirm_password == ""
      render status: 401, json: { error: 'The request MUST contain the user email and password.' }
      return
    end

    build_resource(sign_up_params)
    user = User.find_by(email: email)

    if !user
      if password == confirm_password
        # Note that the data which should be returned depends heavily of the API client needs.
        resource.save
        user = User.find_by(email: email)
        render status: 200, json: { user: user, message: 'Sign Up successfully' }
      else
        render status: 401, json: { error: 'Password MUST matched' }
      end
    else
      render status: 401, json: { message: 'Email is already taken' }
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
