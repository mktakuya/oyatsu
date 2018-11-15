class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate!, only: [ :sign_in ]

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @uer
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  def sign_in
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      render json: @user
    else
      render json: { errors: ['ログインに失敗しました'] }, status: 401
    end
  end

  def me
  end

  private

  def user_params
    params.permit(
      :email,
      :password,
      :name
    )
  end
end
