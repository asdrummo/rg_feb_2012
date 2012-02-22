require 'test_helper'

class Components::FrontWheelsControllerTest < ActionController::TestCase
  setup do
    @components_front_wheel = components_front_wheels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_front_wheels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_front_wheel" do
    assert_difference('Components::FrontWheel.count') do
      post :create, :components_front_wheel => @components_front_wheel.attributes
    end

    assert_redirected_to components_front_wheel_path(assigns(:components_front_wheel))
  end

  test "should show components_front_wheel" do
    get :show, :id => @components_front_wheel.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_front_wheel.to_param
    assert_response :success
  end

  test "should update components_front_wheel" do
    put :update, :id => @components_front_wheel.to_param, :components_front_wheel => @components_front_wheel.attributes
    assert_redirected_to components_front_wheel_path(assigns(:components_front_wheel))
  end

  test "should destroy components_front_wheel" do
    assert_difference('Components::FrontWheel.count', -1) do
      delete :destroy, :id => @components_front_wheel.to_param
    end

    assert_redirected_to components_front_wheels_path
  end
end
