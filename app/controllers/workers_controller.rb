class WorkersController < ApplicationController
  before_action :set_project

  def index
    @workers = @project.workers
  end

  def show
    @worker = @project.workers.find(params[:id])
  end

  def new
    @worker = @project.workers.new
  end

  def create
    @worker = @project.workers.new(worker_params)
    if @worker.save
      redirect_to project_workers_path(@project), notice: 'Worker was successfully created.'
    else
      render :new
    end
  end

  def edit
    @worker = @project.workers.find(params[:id])
  end

  def update
    @worker = @project.workers.find(params[:id])
    if @worker.update(worker_params)
      redirect_to project_worker_path(@project, @worker), notice: 'Worker was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @worker = @project.workers.find(params[:id])
    @worker.destroy
    redirect_to project_workers_path(@project), notice: 'Worker was successfully destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def worker_params
    params.require(:worker).permit(:name, :role, :project_id) # Adjust the permitted params as necessary
  end
end
