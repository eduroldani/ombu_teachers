class ProjectsController < ApplicationController

  def index
    @projects = Project.all

    @markers = @projects.geocoded.map do |project|
      {
        lat: project.latitude,
        lng: project.longitude
      }
    end
  end



  def index
    if params[:query].present?
        @projects = Project.search_by_title(params[:query])
        @markers = @projects.geocoded.map do |project|
          {
            lat: project.latitude,
            lng: project.longitude
          }
        end
    else
        @projects = Project.all
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
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save!
      redirect_to projects_path
    else
      redirect_to new_project_path
    end
  end


  def destroy

  end


  def project_params
    params.require(:project).permit(:title, :description, :user_id, :comment, :photo)
  end
end
