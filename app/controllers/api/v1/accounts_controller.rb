class Api::V1::AccountsController < ApplicationController
  def update
    @user = current_user

    if @user.update_without_password(account_params)
      render json: @user, serializer: UserWithTokenSerializer, status: 200
    else
      render json: { errors: @user.errors.full_messages }, status: 400
    end
  end

  def password
    @user = current_user

    @user.password = params[:password]

    if @user.save
      render json: @user, serializer: UserWithTokenSerializer
    else
      render json:{ errors: @user.errors.full_messages }
    end
  end

  private

  def account_params
    params.permit(
      :email,
      :name
    )
  end
end
