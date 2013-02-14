class ProjectsController < ApplicationController

before_filter :load_user

	def index
		@projects = Project.all
	end
	
	def new
		@project = Project.new
		@users = User.all
	end
	
	def create
		@project = Project.new(params[:project]) 
		if @project.save
			redirect_to projects_path(@project),:notice=>"Successfully created"
		else
			render :action=>:new
		end	

	end
	
	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		params[:project][:user_ids] = [] if params[:project][:user_ids].blank?
		if @project.update_attributes(params[:project])
			redirect_to project_path(@project),:notice=>"Successfully updated"
		else
			#@users = User.all
			render :action=>:edit
		end	
	end
	
	def show
		@project = Project.find(params[:id])

	end
	
	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to projects_path,:notice=>"Successfully Destroy"
	end

	def load_user
			@users = User.all
	end

	def finish_project
		@project =  Project.find(params[:id])
		@project.set_finish
		#binding.pry
		if @project.save
			redirect_to projects_path(@project),:notice=>"Project is finish"
		else
			redirect_to projects_path(@project),:notice=>"Milestone is not finish"
		end
	end

end