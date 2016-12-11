class UsersController < ApplicationController

  def information
		@user = User.find_by(id: current_user.id)
  	@bookings = Booking.where(user_id: current_user.id)
  	@lasttrainclass = Trainclass.where(id: current_user.bookings.last.trainclass_id)
  	@lastbook = @lasttrainclass[0]

		render "information.html.erb"
  end

  def show
  	@user = current_user
  	@my_fit_tracker = My_fit_tracker.new

  	render "my_fit_trackers"
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
		@user = User.find_by(id: current_user.id)
		render "data.html.erb"
  end

	def add_trainclass

		user = User.find_by(id: params[:id])
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

		user = User.find_by(id: current_user.id)
  	@bookings = Booking.where(user_id: current_user.id)

		unless user
			render json: { error: "User not found" }, status: 404
			return		
		end
		render "athlete_info.html.erb"
		# render json: {user: user, trainclasses: user.trainclasses}
	end
end
