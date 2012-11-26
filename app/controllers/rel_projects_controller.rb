class RelProjectsController < ApplicationController
	before_filter :signed_in_user

	def create
		@project = User.find(params[:rel_project][:project_id])
		current_user.add_project!(@project)
		@project.add_user!(current_user)
		redirect_to root_path
	end

	def destroy
		@project = RelProject.find(params[:id]).project
		current_user.remove_project!(@project)
		@project.remove_user!(current_user)
		redirect_to root_path
	end
end