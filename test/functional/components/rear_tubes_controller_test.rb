require 'test_helper'

class Components::RearTubesControllerTest < ActionController::TestCase
  setup do
    @components_rear_tube = components_rear_tubes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_rear_tubes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_rear_tube" do
    assert_difference('Components::RearTube.count') do
      post :create, :components_rear_tube => @components_rear_tube.attributes
    end

    assert_redirected_to components_rear_tube_path(assigns(:components_rear_tube))
  end

  test "should show components_rear_tube" do
    get :show, :id => @components_rear_tube.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_rear_tube.to_param
    assert_response :success
  end

  test "should update components_rear_tube" do
    put :update, :id => @components_rear_tube.to_param, :components_rear_tube => @components_rear_tube.attributes
    assert_redirected_to components_rear_tube_path(assigns(:components_rear_tube))
  end

  test "should destroy components_rear_tube" do
    assert_difference('Components::RearTube.count', -1) do
      delete :destroy, :id => @components_rear_tube.to_param
    end

    assert_redirected_to components_rear_tubes_path
  end
end
