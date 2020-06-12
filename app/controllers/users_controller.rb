class UsersController < ApplicationController
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # protected

  # private
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday_date])
  # end

  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == Rails.application.credentials[:basic_auth][:user] &&
  #     password == Rails.application.credentials[:basic_auth][:pass]
  #   end
  # end

  # def production?
  #   Rails.env.production?
  # end
  def show
  end

end
