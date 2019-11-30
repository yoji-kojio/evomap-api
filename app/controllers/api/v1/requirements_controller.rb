class Api::V1::RequirementsController < ApplicationController
  before_action :set_requirement, only: [:show, :update, :destroy]

  # GET /api/v1/requirements
  def index
    @requirements = Requirement.all
    render json: @requirements
  end

  # GET /api/v1/requirements/1
  def show
    render json: @requirement
  end

  # POST /api/v1/requirements
  def create
    @requirement = Requirement.new(requirement_params)

    if @requirement.save
      render json: @requirement, status: :created
    else
      render json: @requirement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/requirements/1
  def update
    if @requirement.update(requirement_params)
      render json: @requirement
    else
      render json: @requirement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/requirements/1

  def destroy
    @requirement.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_requirement
    @requirement = Requirement.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def requirement_params
    params.require(:requirement).permit(:name, :description)
  end
end
