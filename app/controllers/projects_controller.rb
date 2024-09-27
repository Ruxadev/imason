# app/controllers/projects_controller.rb
class ProjectsController < ApplicationController
  before_action :authenticate_user! # Ensure the user is logged in
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects # Show only projects for the logged-in user
  end

  def show; end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to @project, notice: "Project was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: "Project was successfully destroyed."
  end

  private

  def set_project
    @project = current_user.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
