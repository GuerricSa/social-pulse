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

  def toggle_favorite
    @user = User.find(params[:id])
    if current_user
      if current_user.favorited?(@user)
        current_user.unfavorite(@user)
      else
        current_user.favorite(@user)
      end
    else
      redirect_to new_user_session_path
    end
  end

  def ban
    @user = User.find(params[:id])
    @user.destroy
    redirect_to activities_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
