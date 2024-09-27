# app/controllers/workers_controller.rb
class WorkersController < ApplicationController
  before_action :set_project, only: [:index, :new, :create]
  before_action :set_worker, only: [:show, :edit, :update, :destroy]

  def index
    if params[:project_id].present?
      @project = Project.find(params[project_id])
      @workers = @project.workers
    else
      @workers = Worker.all
    end
  end

  def show; end

  def new
    @worker = @project.workers.build
  end

  def edit; end

  def create
    @worker = @project.workers.build(worker_params)
    if @worker.save
      redirect_to [@project, @worker], notice: "Worker was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @worker.update(worker_params)
      redirect_to @worker, notice: "Worker was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @worker.destroy
    redirect_to workers_url, notice: "Worker was successfully destroyed."
  end

  private

  def set_project
    @project = Project.find(params[:project_id]) if params[:project_id].present?
  end

  def set_worker
    @worker = Worker.find(params[:id])
  end

  def worker_params
    params.require(:worker).permit(:name, :phone, :rate, :paid_value, :worked_hours, :project_id)
  end
end
