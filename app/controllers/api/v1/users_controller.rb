class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :set_user_by_username, only: [
    :get_user_career,
    :get_user_requirements,
    :get_user_recommended_contents
  ]

  # GET /api/v1/users
  def index
    @users = User.all
    render json: @users
  end

  # GET /api/v1/users/1
  def show
    render json: @user
  end

  # POST /api/v1/users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/1

  def destroy
    @user.destroy
  end

  def get_user_career
    career = @user.careers.first
    render json: career.presence || {}
  end

  def get_user_requirements
    all_requirements = @user.requirements
    finished_requirements = @user.requirements.where(user_requirements: { finished: true })
    not_finished_requirements = @user.requirements.where(user_requirements: { finished: false })
    user_requirements = @user.user_requirements

    requirements_data = {
      'all_requirements' => all_requirements,
      'finished_requirements' => finished_requirements,
      'not_finished_requirements' => not_finished_requirements,
    }

    render json: requirements_data.presence || {}
  end

  def get_user_recommended_contents
    not_finished_requirements = @user.requirements.where(user_requirements: { finished: false })

    contents_list = not_finished_requirements.map { |requirement| requirement.contents }
    recommended_contents = contents_list.flatten

    render json: recommended_contents.presence || {}
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def set_user_by_username
    @user = User.find_by(username: params[:username])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :email, :description, :username)
  end
end
