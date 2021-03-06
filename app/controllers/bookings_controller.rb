class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:destroy]

  respond_to :json

  def index
    @bookings = Booking.where(user_id: current_user.id).order(created_at: :desc)
  end

  def new
    @booking = Booking.new
  end

  def create
    @userid = params[:user_id]
    @trainid = params[:id]

    @tc = Trainclass.find_by(id: @trainid)
    @bk = Booking.where(user_id: current_user.id)

    if @bk.where(trainclass_id: @tc.id) === []
      @booking = Booking.create(user_id: @userid, trainclass_id: @trainid)
      @tc.update(quota: (@tc.quota + 1))

      redirect_to "/users/"+@userid+"/athlete_info/bookings"
    else
      redirect_to trainclasses_path, notice: "You have booked this class"
    end

  end

  def destroy
    @booking.destroy
    redirect_to athlete_booking_index_path(current_user.id)
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      @userid = params[:user_id]
      @trainid = params[:format]

    end
end
