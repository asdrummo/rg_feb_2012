require 'test_helper'

class Components::RearLeversControllerTest < ActionController::TestCase
  setup do
    @components_rear_lever = components_rear_levers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_rear_levers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_rear_lever" do
    assert_difference('Components::RearLever.count') do
      post :create, :components_rear_lever => @components_rear_lever.attributes
    end

    assert_redirected_to components_rear_lever_path(assigns(:components_rear_lever))
  end

  test "should show components_rear_lever" do
    get :show, :id => @components_rear_lever.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_rear_lever.to_param
    assert_response :success
  end

  test "should update components_rear_lever" do
    put :update, :id => @components_rear_lever.to_param, :components_rear_lever => @components_rear_lever.attributes
    assert_redirected_to components_rear_lever_path(assigns(:components_rear_lever))
  end

  test "should destroy components_rear_lever" do
    assert_difference('Components::RearLever.count', -1) do
      delete :destroy, :id => @components_rear_lever.to_param
    end

    assert_redirected_to components_rear_levers_path
  end
end
