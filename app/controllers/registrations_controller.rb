# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  before_action :set_user, only: %i[edit update]

  def edit; end

  def update
    @user.update(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :email, :password,
                                 :password_confirmation, :phone_number, :date_of_birth, :company_name)
  end

  def set_user
    @user = User.find_by(params[:id])
  end
end
