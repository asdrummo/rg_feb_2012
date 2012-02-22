require 'test_helper'

class Components::SaddlesControllerTest < ActionController::TestCase
  setup do
    @components_saddle = components_saddles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_saddles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_saddle" do
    assert_difference('Components::Saddle.count') do
      post :create, :components_saddle => @components_saddle.attributes
    end

    assert_redirected_to components_saddle_path(assigns(:components_saddle))
  end

  test "should show components_saddle" do
    get :show, :id => @components_saddle.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_saddle.to_param
    assert_response :success
  end

  test "should update components_saddle" do
    put :update, :id => @components_saddle.to_param, :components_saddle => @components_saddle.attributes
    assert_redirected_to components_saddle_path(assigns(:components_saddle))
  end

  test "should destroy components_saddle" do
    assert_difference('Components::Saddle.count', -1) do
      delete :destroy, :id => @components_saddle.to_param
    end

    assert_redirected_to components_saddles_path
  end
end
