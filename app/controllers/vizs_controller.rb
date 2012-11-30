class VizsController < ApplicationController
	before_filter :signed_in_user
	#before_filter :correct_user, only: :destroy

	def create
		@project = Project.find(get_stored_project_id)
		@viz = @project.vizs.build(params[:viz])
		if @viz.save
			flash[:success] = "New viz saved!"
			redirect_to project_path(@project)
		else
			render project_path(@project)
		end
	end

	def destroy
		@viz.destroy
		redirect_to project_path(@project)
	end

	private

	#	def correct_user
	#		@time_entry = current_user.


end
