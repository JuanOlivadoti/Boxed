class MyFitTrackerController < ApplicationController
	before_action :set_user

	def index
		@my_fit_trackers = MyFitTracker.where(user_id: current_user.id).order(created_at: :desc)

		render "users/my_fit"
	end

	def show
		@my_fit_trackers = MyFitTracker.where(user_id: current_user.id).order(created_at: :desc)
	end

	def create
		@my_fit_tracker = MyFitTracker.new(my_fit_tracker_params)
		@my_fit_tracker.save

		render json: @my_fit_tracker
	end

	def destroy
		@my_fit_tracker = MyFitTracker.find_by(id: params[:id])
		@my_fit_tracker.destroy

		redirect_to  my_fit_tracker_index_path
	end

	private

	def set_user
		@user = User.find(params[:user_id])
	end

	def my_fit_tracker_params
		params.permit(:user_id, :exercise, :value, :um, :exercise_type)
	end
end