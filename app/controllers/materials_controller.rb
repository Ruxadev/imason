# app/controllers/materials_controller.rb
class MaterialsController < ApplicationController
  before_action :set_project, only: [:index, :new, :create]
  before_action :set_material, only: [:show, :edit, :update, :destroy]

  def index
    if params[:project_id].present?
      @project = Project.find(params[:project_id])
      @materials = @project.materials
    else
      project = nil
      @materials = Material.all
    end
  end

  def show; end

  def new
    @material = @project.materials.build
  end

  def edit; end

  def create
    @material = @project.materials.build(material_params)
    if @material.save
      redirect_to [@project, @material], notice: "Material was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @material.update(material_params)
      redirect_to @material, notice: "Material was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @material.destroy
    redirect_to materials_url, notice: "Material was successfully destroyed."
  end

  private

  def set_project
    @project = Project.find(params[:project_id]) if params[:project_id].present?
  end

  def set_material
    @material = Material.find(params[:id])
  end

  def material_params
    params.require(:material).permit(:store_name, :phone, :rate, :paid_value, :project_id)
  end
end
