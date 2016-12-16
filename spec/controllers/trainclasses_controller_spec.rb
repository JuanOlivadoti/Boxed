require 'rails_helper'

RSpec.describe TrainclassesController, type: :controller do

	describe "GET index" do

		before(:each) do
					@data = {
							date: Date.today,
							datetime: Time.new(2015, 12, 19, 9, 00, 0),
							capacity: 15,
							train_class_type: 0,
							coach_id: 1,
							quota: 5,			
							}

          @trainclass = Trainclass.create!(@data)
    end

    it "assigns @trainclass" do
      @trainclass = Trainclass.create!(@data)
      get :index
      expect(@trainclass.quota).to eq(5)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  setup do
    @trainclass = Trainclass.all
  end

  it "should get index" do
    get trainclasses_url
    assert_response :success
  end

  it "should get new" do
    get new_trainclass_url
    assert_response :success
  end

  it "should create trainclass" do
    assert_difference('Trainclass.count') do
      post trainclasses_url, params: { trainclass: { coach_id: @trainclass.coach_id, date: @trainclass.date, max_quota: @trainclass.max_quota, time: @trainclass.time, train_class_type: @trainclass.train_class_type } }
    end

    assert_redirected_to trainclass_url(Trainclass.last)
  end

  it "should show trainclass" do
    get trainclass_url(@trainclass)
    assert_response :success
  end

  it "should get edit" do
    get edit_trainclass_url(@trainclass)
    assert_response :success
  end

  it "should update trainclass" do
    patch trainclass_url(@trainclass), params: { trainclass: { coach_id: @trainclass.coach_id, date: @trainclass.date, max_quota: @trainclass.max_quota, time: @trainclass.time, train_class_type: @trainclass.train_class_type } }
    assert_redirected_to trainclass_url(@trainclass)
  end

  it "should destroy trainclass" do
    assert_difference('Trainclass.count', -1) do
      delete trainclass_url(@trainclass)
    end

    assert_redirected_to trainclasses_url
  end

end
