class HallsController < ApplicationController

  protect_from_forgery prepend: true
  before_action :authenticate_user!

  def index
    @projects = Project.all
  end
end
