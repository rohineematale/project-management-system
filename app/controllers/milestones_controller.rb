require "pry"
class MilestonesController < ApplicationController

	before_filter :load_projects

	def index
		@milestones = @project.milestones
	end

	def show
		@milestone = @project.milestones.find(params[:id])
		#binding.py
	end

	def new
		#binding.pry
		@milestone = @project.milestones.new
	end

	def create
		@milestone = @project.milestones.new(params[:milestone]) 

		if @milestone.save
			redirect_to project_milestones_path(@project,@milestone),:notice=>"Successfully created"
		else
			render :action=>:new
		end	
	end

	def edit
		@milestone = @project.milestones.find(params[:id])
	end

	def update
		@milestone = @project.milestones.find(params[:id])
		if @milestone.update_attributes(params[:milestone])
			redirect_to project_milestones_path(@project,@milestone),:notice=>"Successfully updated"
		else
			render :action=>:edit
		end	
	end

	def destroy
		@milestone = @project.milestones.find(params[:id])
		@milestone.destroy
		redirect_to project_milestones_path,:notice=>"Successfully Destroy"
	end

	def finish_milestone
		@milestone =  @project.milestones.find(params[:id])
		@milestone.set_finish
		#binding.pry
		if @milestone.save
			redirect_to project_milestones_path(@project),:notice=>"Milestone is finish"
		else
			redirect_to project_milestones_path(@project),:notice=>"Milestone is not finish"
		end
	end

end

def load_projects
		@project = Project.find(params[:project_id])	
end