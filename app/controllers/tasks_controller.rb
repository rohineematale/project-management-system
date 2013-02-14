class TasksController < ApplicationController
	
	before_filter :load_project_milestones

	def index
		#binding.pry
		@tasks=@milestone.tasks

	end

	def show
		@task=@milestone.tasks.find(params[:id])
	end

	def new
		@task=@milestone.tasks.new
		
	end

	def create
		@task=@milestone.tasks.new(params[:task])
		if @task.save
			redirect_to project_milestone_tasks_path(@project,@milestone,@task),:notice=>"Successfully created"
		else
			render :action=>:new
		end	
	end

	def edit
		@task=@milestone.tasks.find(params[:id])
		#@user=User.all
		#@milestone=Milestone.all	
	end

	def update
		@task=@milestone.tasks.find(params[:id])
		if @task.update_attributes(params[:task])
			redirect_to project_milestone_tasks_path(@project,@milestone,@task),:notice=>"Updated Successfully"
		else
			render :action=>:edit
		end
	end

	def destroy
		@task=@milestone.tasks.find(params[:id])
		@task.destroy
		redirect_to project_milestone_tasks_path(@project,@milestone,@task), :notice=>"Destroyed Successfully"
	end

	def finish_task
		@task =  @milestone.tasks.find(params[:id])
		@task.set_finish
		#binding.pry
		if @task.save
			redirect_to project_milestone_tasks_path(@project,@milestone),:notice=>"Milestone is finish"
		else
			redirect_to project_milestone_tasks_path(@project,@milestone),:notice=>"Milestone is not finish"
		end
	end

	def load_project_milestones
		@user=User.all
		@project=Project.find(params[:project_id])
		@milestone=@project.milestones.find(params[:milestone_id])	
	end
end