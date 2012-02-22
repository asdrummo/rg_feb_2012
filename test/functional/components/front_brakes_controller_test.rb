require 'test_helper'

class Components::FrontBrakesControllerTest < ActionController::TestCase
  setup do
    @components_front_brake = components_front_brakes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_front_brakes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_front_brake" do
    assert_difference('Components::FrontBrake.count') do
      post :create, :components_front_brake => @components_front_brake.attributes
    end

    assert_redirected_to components_front_brake_path(assigns(:components_front_brake))
  end

  test "should show components_front_brake" do
    get :show, :id => @components_front_brake.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_front_brake.to_param
    assert_response :success
  end

  test "should update components_front_brake" do
    put :update, :id => @components_front_brake.to_param, :components_front_brake => @components_front_brake.attributes
    assert_redirected_to components_front_brake_path(assigns(:components_front_brake))
  end

  test "should destroy components_front_brake" do
    assert_difference('Components::FrontBrake.count', -1) do
      delete :destroy, :id => @components_front_brake.to_param
    end

    assert_redirected_to components_front_brakes_path
  end
end
