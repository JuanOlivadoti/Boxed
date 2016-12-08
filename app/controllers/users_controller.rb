class UsersController < ApplicationController

  def bookings
  	# binding.pry
  	@bookings = Booking.where(user_id: current_user.id)
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
end
