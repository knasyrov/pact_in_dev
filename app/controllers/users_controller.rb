class UsersController < ApplicationController
  before_action :set_user, only: %i[ show ]

  # GET /users
  def index
    @users = User.includes(:skills, :interests).all
    render json: @users.as_json(include: [:skills, :interests])
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    user = Users::Create.run!(user_params)

    if user.valid?
      redirect_to(user.result)
    else
      @user = user
      render(:new)
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.fetch(:user, {})
    end
end
