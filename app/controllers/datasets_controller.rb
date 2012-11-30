class DatasetsController < ApplicationController
	before_filter :signed_in_user

	def create
		@project = Project.find(get_stored_project_id)
		@dataset = @project.datasets.build(params[:dataset])
		@viz = @project.vizs.build
		if @dataset.save
			flash[:success] = "New dataset saved!"
			redirect_to project_path(@project)
		else
			#flash[:error] = "New dataset saved!"
			render 'projects/show'
			#render :file => "../projects/#{@project.id}"
		end
	end

	def destroy
		@dataset.destroy
		redirect_to project_path(@project)
	end

	private


end
