require 'test_helper'

class Components::RearBrakesControllerTest < ActionController::TestCase
  setup do
    @components_rear_brake = components_rear_brakes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_rear_brakes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_rear_brake" do
    assert_difference('Components::RearBrake.count') do
      post :create, :components_rear_brake => @components_rear_brake.attributes
    end

    assert_redirected_to components_rear_brake_path(assigns(:components_rear_brake))
  end

  test "should show components_rear_brake" do
    get :show, :id => @components_rear_brake.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_rear_brake.to_param
    assert_response :success
  end

  test "should update components_rear_brake" do
    put :update, :id => @components_rear_brake.to_param, :components_rear_brake => @components_rear_brake.attributes
    assert_redirected_to components_rear_brake_path(assigns(:components_rear_brake))
  end

  test "should destroy components_rear_brake" do
    assert_difference('Components::RearBrake.count', -1) do
      delete :destroy, :id => @components_rear_brake.to_param
    end

    assert_redirected_to components_rear_brakes_path
  end
end
