class TrainclassesController < ApplicationController

  respond_to :json
  def index

    @tc = Trainclass.all.order(id: :asc)
    @tcgrouped = @tc.group_by_day(&:date)

    mon = Hash[*@tcgrouped.to_a.at(0)]
      @m = mon.first{0}
    tue = Hash[*@tcgrouped.to_a.at(1)]
      @t = tue.first{0}
    wed = Hash[*@tcgrouped.to_a.at(2)]
      @w = wed.first{0}
    thu = Hash[*@tcgrouped.to_a.at(3)]
      @th = thu.first{0}
    fri = Hash[*@tcgrouped.to_a.at(4)]
      @f = fri.first{0}
    sat = Hash[*@tcgrouped.to_a.at(5)]
      @s = sat.first{0}
    sun = Hash[*@tcgrouped.to_a.at(6)]
      @su = sun.first{0}

    @dte = Date.current()

  end

  def show
    @trainclass = Trainclass.find_by(id: params[:id])
  end

  def new
    @trainclass = Trainclass.new
  end

  def edit
    @trainclass = Trainclass.find_by(id: params[:id])
  end

  def create
    @trainclass = Trainclass.new(trainclass_params)
    

    respond_to do |format|
      if @trainclass.save
        format.html { redirect_to @trainclass, notice: 'Trainclass was successfully created.' }
        format.json { render :show, status: :created, location: @trainclass }
      else
        format.html { render :new }
        format.json { render json: @trainclass.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @trainclass.update(trainclass_params)
        format.html { redirect_to @trainclass, notice: 'Trainclass was successfully updated.' }
        format.json { render :show, status: :ok, location: @trainclass }
      else
        format.html { render :edit }
        format.json { render json: @trainclass.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    @trainclass = Trainclass.find_by(id: params[:id])

    @trainclass.destroy
    respond_to do |format|
      format.html { redirect_to trainclasses_url, notice: 'Trainclass was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_trainclass
      @trainclass = Trainclass.find(params[:id])
    end

    def trainclass_params
      params.require(:trainclass).permit(:date, :time, :capacity, :train_class_type, :coach_id)
    end
end
