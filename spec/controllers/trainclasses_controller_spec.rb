# require 'rails_helper'

RSpec.describe "TrainclassesController", type: :controller do

	describe "GET index" do
          let(:trainclass) {Trainclass.create(@data)} 

		before(:each) do
					@data = {
							date: Date.today,
							datetime: Time.new(2015, 12, 19, 9, 00, 0),
							capacity: 15,
							train_class_type: 0,
							coach_id: 1,
							quota: 5,			
							}

    end
    it 'sets the type_id field' do
      resource.type_id.should == type.id
    end
    
    it "assigns @trainclass" do
      get(:index)
      expect(trainclass.quota).to eq(5)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

 

end
