class TimeEntriesController < ApplicationController
	before_filter :signed_in_user
	#before_filter :correct_user, only: :destroy

	def create
		@project = Project.find(get_stored_project_id)
		@time_entry = @project.time_entries.build(params[:time_entry])
		if @time_entry.save
			flash[:success] = "New entry saved!"
			redirect_to project_path(@project)
		else
			render project_path(@project)
		end
	end

	def destroy
		@time_entry.destroy
		redirect_to project_path(@project)
	end

	private

	#	def correct_user
	#		@time_entry = current_user.


end
