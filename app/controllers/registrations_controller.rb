# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @destination = @user.build_destination
    render :new_destination
  end

  def create_destination
    @user = User.new(session["devise.regist_data"]["user"])
    @destination = Destination.new(destination_params)
    unless @destination.valid?
      flash.now[:alert] = @destination.errors.full_messages
      render :new_destination and return
    end
    @user.build_destination(@destination.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
  end



  protected

  def destination_params
    params.require(:destination).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :prefecture_code, :city, :house_number, :building_name, :phone_number)
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

end