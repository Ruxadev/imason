# app/controllers/materials_controller.rb
class MaterialsController < ApplicationController
  before_action :set_project
  before_action :set_material, only: [:show, :edit, :update, :destroy]

  def index
    @materials = @project.materials
  end

  def show; end

  def new
    @material = @project.materials.build
  end

  def edit; end

  def create
    @material = @project.materials.new(material_params)
    if @material.save
      redirect_to project_materials_path(@project), notice: 'Material was successfully created.'
    else
      puts @material.errors.full_messages # Log the errors to the console
      render :new
    end
  end

  def update
    if @material.update(material_params)
      redirect_to project_material_path(@project, @material), notice: "Material was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @material.destroy
    redirect_to project_materials_path(@project), notice: 'Material was successfully destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Project not found."
    redirect_to projects_path and return
  end

  def set_material
    @material = @project.materials.find_by(id: params[:id])
    unless @material
      flash[:alert] = "Material not found."
      redirect_to project_materials_path(@project) and return
    end
  end

  def material_params
    params.require(:material).permit(:store_name, :phone, :rate, :paid_value, :quantity)
  end
end
