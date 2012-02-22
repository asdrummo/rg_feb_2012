require 'test_helper'

class Components::FrontTubesControllerTest < ActionController::TestCase
  setup do
    @components_front_tube = components_front_tubes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_front_tubes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_front_tube" do
    assert_difference('Components::FrontTube.count') do
      post :create, :components_front_tube => @components_front_tube.attributes
    end

    assert_redirected_to components_front_tube_path(assigns(:components_front_tube))
  end

  test "should show components_front_tube" do
    get :show, :id => @components_front_tube.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_front_tube.to_param
    assert_response :success
  end

  test "should update components_front_tube" do
    put :update, :id => @components_front_tube.to_param, :components_front_tube => @components_front_tube.attributes
    assert_redirected_to components_front_tube_path(assigns(:components_front_tube))
  end

  test "should destroy components_front_tube" do
    assert_difference('Components::FrontTube.count', -1) do
      delete :destroy, :id => @components_front_tube.to_param
    end

    assert_redirected_to components_front_tubes_path
  end
end
