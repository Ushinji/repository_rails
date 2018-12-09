class Api::ProjectsController < ApplicationController
  def index
    projects = ProjectRepository.new.find_all
    render json: projects
  end
end
