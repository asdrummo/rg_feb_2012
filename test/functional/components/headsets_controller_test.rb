require 'test_helper'

class Components::HeadsetsControllerTest < ActionController::TestCase
  setup do
    @components_headset = components_headsets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_headsets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_headset" do
    assert_difference('Components::Headset.count') do
      post :create, :components_headset => @components_headset.attributes
    end

    assert_redirected_to components_headset_path(assigns(:components_headset))
  end

  test "should show components_headset" do
    get :show, :id => @components_headset.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_headset.to_param
    assert_response :success
  end

  test "should update components_headset" do
    put :update, :id => @components_headset.to_param, :components_headset => @components_headset.attributes
    assert_redirected_to components_headset_path(assigns(:components_headset))
  end

  test "should destroy components_headset" do
    assert_difference('Components::Headset.count', -1) do
      delete :destroy, :id => @components_headset.to_param
    end

    assert_redirected_to components_headsets_path
  end
end
