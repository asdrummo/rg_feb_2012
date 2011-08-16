require 'test_helper'

class Components::GripsControllerTest < ActionController::TestCase
  setup do
    @components_grip = components_grips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_grips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_grip" do
    assert_difference('Components::Grip.count') do
      post :create, :components_grip => @components_grip.attributes
    end

    assert_redirected_to components_grip_path(assigns(:components_grip))
  end

  test "should show components_grip" do
    get :show, :id => @components_grip.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_grip.to_param
    assert_response :success
  end

  test "should update components_grip" do
    put :update, :id => @components_grip.to_param, :components_grip => @components_grip.attributes
    assert_redirected_to components_grip_path(assigns(:components_grip))
  end

  test "should destroy components_grip" do
    assert_difference('Components::Grip.count', -1) do
      delete :destroy, :id => @components_grip.to_param
    end

    assert_redirected_to components_grips_path
  end
end
