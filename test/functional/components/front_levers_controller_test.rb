require 'test_helper'

class Components::FrontLeversControllerTest < ActionController::TestCase
  setup do
    @components_front_lever = components_front_levers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_front_levers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_front_lever" do
    assert_difference('Components::FrontLever.count') do
      post :create, :components_front_lever => @components_front_lever.attributes
    end

    assert_redirected_to components_front_lever_path(assigns(:components_front_lever))
  end

  test "should show components_front_lever" do
    get :show, :id => @components_front_lever.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_front_lever.to_param
    assert_response :success
  end

  test "should update components_front_lever" do
    put :update, :id => @components_front_lever.to_param, :components_front_lever => @components_front_lever.attributes
    assert_redirected_to components_front_lever_path(assigns(:components_front_lever))
  end

  test "should destroy components_front_lever" do
    assert_difference('Components::FrontLever.count', -1) do
      delete :destroy, :id => @components_front_lever.to_param
    end

    assert_redirected_to components_front_levers_path
  end
end
