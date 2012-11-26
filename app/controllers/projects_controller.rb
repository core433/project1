class ProjectsController < ApplicationController
  before_filter :signed_in_user

  def new
  	@project = Project.new
  end

  def show
    if signed_in?
      @project = Project.find(params[:id])
      store_project_id(@project.id)
      @time_entry = @project.time_entries.build
    end
  end

  def create
  	@project = Project.new(params[:project])
  	if @project.save
  		flash[:success] = "Welcome to your new project!"
  		redirect_to @project
      current_user.add_project!(@project)
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      # Handle a successful update
      flash[:success] = "Project successfully updated!"
      redirect_to @project
    else
      render 'edit'
    end
  end

end








