class MyFitTrackerController < ApplicationController
	before_action :set_user

	def index
		@my_fit_trackers = MyFitTracker.where(user_id: current_user.id)

		render "users/my_fit"
	end

	def show
		@my_fit_trackers = MyFitTracker.where(user_id: current_user.id)
	end

	def create
		# binding.pry
		@my_fit_tracker = MyFitTracker.new
		@my_fit_tracker = @user.my_fit_trackers.create(my_fit_tracker_params)

		redirect_to @user
	end

	private

	def set_user
		@user = User.find(params[:user_id])
	end

	def my_fit_tracker_params
		params[:my_fit_tracker].permit(:user, :exercise, :value, :um, :exercise_type)
	end
end