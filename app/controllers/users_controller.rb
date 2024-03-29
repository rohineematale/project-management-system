class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
		@projects=Project.all
	end

	def create
		@user = User.new(params[:user]) 
		if @user.save
			redirect_to users_path(@user),:notice=>"Successfully created"
		else
			@projects=Project.all		
			render :action=>:new
		end	
	end

	def edit
		@user = User.find(params[:id])
		@projects=Project.all
	end

	def update
		@user = User.find(params[:id])
		params[:user][:project_ids] = [] if params[:user][:project_ids].blank?
		if @user.update_attributes(params[:user])
			redirect_to user_path(@user),:notice=>"Successfully updated"
		else
			@projects=Project.all
			render :action=>:edit
		end	
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path,:notice=>"Successfully Destroy"
	end
end

