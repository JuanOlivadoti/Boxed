class BookingsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json
  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.where(user_id: current_user.id)

  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create

    @userid = params[:user_id]
    @trainid = params[:format]
    
    @booking = Booking.create(user_id: @userid, trainclass_id: @trainid)

    redirect_to "/users/"+@userid+"/athlete_info/bookings"
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    # binding.pry

    @booking = Booking.find(params[:id])
    @booking.destroy
    render json: {user: current_user, bookings: @booking.user_id, trainclass: @booking.trainclass_id}
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
