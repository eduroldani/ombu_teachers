class ProjectsController < ApplicationController

  def index
    @projects = Project.all
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
    params.require(:project).permit(:title, :description, :user_id, :comment)
  end
end
