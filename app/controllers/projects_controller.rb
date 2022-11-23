class ProjectsController < ApplicationController

  def index

    if params[:query].present?
        @projects = policy_scope(Project).search_by_title(params[:query])
        @markers = @projects.geocoded.map do |project|
          {
            lat: project.latitude,
            lng: project.longitude
          }
        end
    else
         @projects = policy_scope(Project).all
        @markers = @projects.geocoded.map do |project|
          {
            lat: project.latitude,
            lng: project.longitude
          }
        end
    end
  end


  def show
    @project = Project.find(params[:id])
    authorize @project
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    if @project.save!
      authorize @project

      redirect_to projects_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
    @project = Project.find(params[:id])
    authorize @project
    @project.destroy
    redirect_to projects_path

  end


  def project_params
    params.require(:project).permit(:title, :description, :user_id, :comment, :photo)
  end
end
