class RelProjectsController < ApplicationController
	before_filter :signed_in_user

	def create
		@project = User.find(params[:rel_project][:project_id])
		#@user = User.find(params[:rel_project][:user_id])
		current_user.add_project!(@project)
		redirect_to project_path(@project)
	end

	def destroy
		@rel_project = RelProject.find(params[:id])
		@project = Project.find_by_id(@rel_project.project_id)
		@rel_project.destroy
		redirect_to project_path(@project)
	end
end