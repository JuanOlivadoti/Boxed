class UserController < ApplicationController
  def bookings
  	@bookings = Bookings.find_by(:user_id current_user.id)
  end
end
