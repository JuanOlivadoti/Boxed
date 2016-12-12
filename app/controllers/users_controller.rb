class UsersController < ApplicationController
	before_action :set_user

  def information
  	@lasttrainclass = Trainclass.where(id: current_user.bookings.last.trainclass_id)

  	if @lasttrainclass != nil?
	  	@lastbook = @lasttrainclass[-1]
	  end

		render "information.html.erb"
  end

  def show
  	@my_fit_trackers = MyFitTracker.where(user_id: current_user.id)

  	render "users/my_fit"
  end

  def bookings
  	@bookings = Booking.where(user_id: current_user.id)
  	@action = "bookings"
  	if @bookings == nil?
	  	@lasttrainclass = Trainclass.where(id: current_user.bookings.last.trainclass_id)
	  	@lastbook = @lasttrainclass[0]
	  end
  	render "bookings.html.erb"
  end

  def data
		render "data.html.erb"
  end

	def add_trainclass
		unless user
			render json: { error: "User not found" }, status: 404
			return		
		end
		trainclass = Trainclass.find_by(id: params[:trainclass_id])

		unless trainclass
			render json: { error: "trainclass not found" }, status: 404
			return	
		end
		# binding.pry
		user.trainclasses.push(trainclass)
		user.save

		render json: {user: user, trainclasses: user.trainclasses}
	end

	def athlete_info
  	@bookings = Booking.where(user_id: current_user.id)

		unless user
			render json: { error: "User not found" }, status: 404
			return		
		end
		render "athlete_info.html.erb"
		# render json: {user: user, trainclasses: user.trainclasses}
	end

	def my_fit_tracker
		@my_fit_trackers = MyFitTracker.where(user_id: current_user.id)

		render "my_fit"
	end

	private

	def set_user
		@user = current_user
	end
end
