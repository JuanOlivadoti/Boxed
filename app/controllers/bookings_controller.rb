class BookingsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json
  # GET /bookings
  # GET /bookings.json
  def index
    binding.pry
    @bookings = Booking.find_by(user_id: current_user.id)
    binding.pry
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
    
    binding.pry

    @booking = Booking.create(user_id: @userid, trainclass_id: @trainid)

    redirect_to "trainclasses/"+@trainid
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
    @booking.destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      binding.pry
      @userid = params[:user_id]
      @trainid = params[:format]

    end
end
