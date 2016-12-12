class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:destroy]

  respond_to :json

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new
  end

  def create
    @userid = params[:user_id]
    @trainid = params[:format]
    # binding.pry

    @tc = Trainclass.find_by(id: @trainid)

    if @tc.quota < (@tc.capacity + 1)
      @booking = Booking.create(user_id: @userid, trainclass_id: @trainid)
      @tc.update(quota: (@tc.quota + 1))
    else
      render :new, notice: "The quota is full"
    end
    
    redirect_to "/users/"+@userid+"/athlete_info/bookings"
  end

  def destroy
    @booking.destroy
    redirect_to athlete_booking_index_path(current_user.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      @userid = params[:user_id]
      @trainid = params[:format]

    end
end
