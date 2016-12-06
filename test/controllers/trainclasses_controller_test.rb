require 'test_helper'

class TrainclassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trainclass = trainclasses(:one)
  end

  test "should get index" do
    get trainclasses_url
    assert_response :success
  end

  test "should get new" do
    get new_trainclass_url
    assert_response :success
  end

  test "should create trainclass" do
    assert_difference('Trainclass.count') do
      post trainclasses_url, params: { trainclass: { coach_id: @trainclass.coach_id, date: @trainclass.date, max_quota: @trainclass.max_quota, time: @trainclass.time, train_class_type: @trainclass.train_class_type } }
    end

    assert_redirected_to trainclass_url(Trainclass.last)
  end

  test "should show trainclass" do
    get trainclass_url(@trainclass)
    assert_response :success
  end

  test "should get edit" do
    get edit_trainclass_url(@trainclass)
    assert_response :success
  end

  test "should update trainclass" do
    patch trainclass_url(@trainclass), params: { trainclass: { coach_id: @trainclass.coach_id, date: @trainclass.date, max_quota: @trainclass.max_quota, time: @trainclass.time, train_class_type: @trainclass.train_class_type } }
    assert_redirected_to trainclass_url(@trainclass)
  end

  test "should destroy trainclass" do
    assert_difference('Trainclass.count', -1) do
      delete trainclass_url(@trainclass)
    end

    assert_redirected_to trainclasses_url
  end
end
