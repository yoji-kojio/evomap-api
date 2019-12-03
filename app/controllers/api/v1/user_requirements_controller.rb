class Api::V1::UserRequirementsController < ApplicationController
  before_action :set_user_requirement, only: [:show, :update, :destroy, :finish_requirement]

  # GET /api/v1/user_requirement_requirements
  def index
    @user_requirement = UserRequirement.all
    render json: @user_requirement
  end

  # GET /api/v1/user_requirement_requirements/1
  def show
    render json: @user_requirement
  end

  # POST /api/v1/user_requirement_requirements
  def create
    @user_requirement = user_requirement.new(user_requirement_params)

    if @user_requirement.save
      render json: @user_requirement, status: :created
    else
      render json: @user_requirement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/user_requirement/1
  def update
    if @user_requirement.update(params)
      render json: @user_requirement
    else
      render json: @user_requirement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/user_requirement_requirements/1
  def destroy
    @user_requirement.destroy
  end

  def finish_requirement
    @user_requirement.finished = !@user_requirement.finished
    render json: @user_requirement.save!
  end

  private

  def set_user_requirement
    @user_requirement = UserRequirement.find(params[:id])
  end
end
