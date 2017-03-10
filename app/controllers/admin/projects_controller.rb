class Admin::ProjectsController < AdminController

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save
  end

  private
    def project_params
      params.require(:project).permit(:name)
    end
end
