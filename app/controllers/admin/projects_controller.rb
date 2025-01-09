
class Admin::ProjectsController < ApplicationController
    before_action :authenticate_admin!
  
    def index
      @projects = Project.all
    end
  
    def edit
      @project = Project.find(params[:id])
    end
  
    def update
      @project = Project.find(params[:id])
      if @project.update(project_params)
        redirect_to admin_projects_path, notice: "Project updated successfully."
      else
        render :edit
      end
    end
  
    def destroy
      @project = Project.find(params[:id])
      @project.destroy
      redirect_to admin_projects_path, notice: "Project deleted successfully."
    end
  
    private
  
    def project_params
      params.require(:project).permit(:name, :description, user_ids: [])
    end
  end
  
