class Admin::ProjectsController < AdminController

  before_action :set_project, only: [:edit, :update]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save
  end

  def edit
  end

  def update
    @project.update(project_params)
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(
        :id, 
        :name,
        user_project_designations_attributes: [:id, :_destroy, :user_id, :project_id]
      )
    end
end
