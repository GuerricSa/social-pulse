# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def show
    @user = User.find(params[:id])
  end

  def account
    @user = current_user
  end

  def edit_age
    @user = current_user
    render 'devise/registrations/edit_age'
  end

  def edit_first_name
    @user = current_user
    render 'devise/registrations/edit_first_name'
  end

  def edit_presentation
    @user = current_user
    render 'devise/registrations/edit_presentation'
  end

  def edit_avatar
    @user = current_user
    render 'devise/registrations/edit_avatar'
  end

  def edit_password
    @user = current_user
    render 'devise/registrations/edit_password'
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
