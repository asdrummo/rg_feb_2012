require 'test_helper'

class Components::RearWheelsControllerTest < ActionController::TestCase
  setup do
    @components_rear_wheel = components_rear_wheels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_rear_wheels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_rear_wheel" do
    assert_difference('Components::RearWheel.count') do
      post :create, :components_rear_wheel => @components_rear_wheel.attributes
    end

    assert_redirected_to components_rear_wheel_path(assigns(:components_rear_wheel))
  end

  test "should show components_rear_wheel" do
    get :show, :id => @components_rear_wheel.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_rear_wheel.to_param
    assert_response :success
  end

  test "should update components_rear_wheel" do
    put :update, :id => @components_rear_wheel.to_param, :components_rear_wheel => @components_rear_wheel.attributes
    assert_redirected_to components_rear_wheel_path(assigns(:components_rear_wheel))
  end

  test "should destroy components_rear_wheel" do
    assert_difference('Components::RearWheel.count', -1) do
      delete :destroy, :id => @components_rear_wheel.to_param
    end

    assert_redirected_to components_rear_wheels_path
  end
end
