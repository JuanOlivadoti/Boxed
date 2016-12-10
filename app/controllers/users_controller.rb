class UsersController < ApplicationController

  def information
		@user = User.find_by(id: current_user.id)
		render "athlete_info.html.erb"
  end

  def data
		@user = User.find_by(id: current_user.id)
		render "athlete_info.html.erb"
  end

  def bookings
  	@bookings = Booking.where(user_id: current_user.id)
  	@action = "bookings"
  	render "athlete_info.html.erb"
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
