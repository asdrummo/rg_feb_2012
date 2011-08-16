require 'test_helper'

class FrameModelsControllerTest < ActionController::TestCase
  setup do
    @frame_model = frame_models(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frame_models)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frame_model" do
    assert_difference('FrameModel.count') do
      post :create, :frame_model => @frame_model.attributes
    end

    assert_redirected_to frame_model_path(assigns(:frame_model))
  end

  test "should show frame_model" do
    get :show, :id => @frame_model.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @frame_model.to_param
    assert_response :success
  end

  test "should update frame_model" do
    put :update, :id => @frame_model.to_param, :frame_model => @frame_model.attributes
    assert_redirected_to frame_model_path(assigns(:frame_model))
  end

  test "should destroy frame_model" do
    assert_difference('FrameModel.count', -1) do
      delete :destroy, :id => @frame_model.to_param
    end

    assert_redirected_to frame_models_path
  end
end
