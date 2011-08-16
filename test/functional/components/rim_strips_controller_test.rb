require 'test_helper'

class Components::RimStripsControllerTest < ActionController::TestCase
  setup do
    @components_rim_strip = components_rim_strips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_rim_strips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_rim_strip" do
    assert_difference('Components::RimStrip.count') do
      post :create, :components_rim_strip => @components_rim_strip.attributes
    end

    assert_redirected_to components_rim_strip_path(assigns(:components_rim_strip))
  end

  test "should show components_rim_strip" do
    get :show, :id => @components_rim_strip.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_rim_strip.to_param
    assert_response :success
  end

  test "should update components_rim_strip" do
    put :update, :id => @components_rim_strip.to_param, :components_rim_strip => @components_rim_strip.attributes
    assert_redirected_to components_rim_strip_path(assigns(:components_rim_strip))
  end

  test "should destroy components_rim_strip" do
    assert_difference('Components::RimStrip.count', -1) do
      delete :destroy, :id => @components_rim_strip.to_param
    end

    assert_redirected_to components_rim_strips_path
  end
end
