class Api::V1::UsersController < ApplicationController
  def create
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
end
