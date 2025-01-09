# class ProjectsController < ApplicationController
# end
class ProjectsController < ApplicationController
    # if you want admin only to delete the project
    # before_action :authenticate_admin!, only: [:destroy]

    before_action :set_project, only: [:show, :edit, :update, :destroy]

    # without filtering
    # def index
    #   @projects = Project.all
    # end

    # filtering projects by a specific user (e.g., to show only projects assigned to the current user)
    def index
      if params[:user_id]
        @projects = User.find(params[:user_id]).projects
      else
        @projects = current_user.projects
      end
    end    
  
    def new
      @project = Project.new
    end
  
    def create
      @project = Project.new(project_params)
      if @project.save
        redirect_to @project, notice: 'Project was successfully created.'
      else
        render :new
      end
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      if @project.update(project_params)
        redirect_to @project, notice: 'Project was successfully updated.'
      else
        render :edit
      end
    end
  
    # def destroy
    #   @project.destroy
    #   redirect_to projects_path, notice: 'Project was successfully destroyed.'
    # end
    def destroy
      @project.destroy
      redirect_to projects_path, notice: 'Project was successfully destroyed.'
    rescue StandardError => e
      redirect_to projects_path, alert: "Error: #{e.message}"
    end
    # def destroy
    #   # Assuming user_projects is a has_many association
    #   @project.user_projects.destroy_all
    #   @project.destroy
    #   redirect_to projects_path, notice: 'Project was successfully destroyed.'
    # end
    
    private
  
    def set_project
      @project = Project.find(params[:id])
    end
  
    # without user id
    # def project_params
    #   params.require(:project).permit(:name, :description)
    # end

    #with user id in order to handle user selection during the project creation and update
    def project_params
      params.require(:project).permit(:name, :description, user_ids: [])
    end
    
  end