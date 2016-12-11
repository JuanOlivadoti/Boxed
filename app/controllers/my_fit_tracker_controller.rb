class MyFitTrackerController < ApplicationController
	before_action :set_user

	def index
		redirect_to "/users/my_fit_tracker"
	end

	def create
		@track = @user.my_fit_trackers.create(my_fit_tracker_params)
		redirect_to user_my_fit_tracker_index_path(@user)
	end

	private

	def set_user
		@user = User.find(params[:user_id])
	end

	def my_fit_tracker_params
		params[:my_fit_tracker].permit(:exercise, :value, :um, :exercise_type)
	end
end