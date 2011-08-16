require 'test_helper'

class Components::PedalsControllerTest < ActionController::TestCase
  setup do
    @components_pedal = components_pedals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_pedals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_pedal" do
    assert_difference('Components::Pedal.count') do
      post :create, :components_pedal => @components_pedal.attributes
    end

    assert_redirected_to components_pedal_path(assigns(:components_pedal))
  end

  test "should show components_pedal" do
    get :show, :id => @components_pedal.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_pedal.to_param
    assert_response :success
  end

  test "should update components_pedal" do
    put :update, :id => @components_pedal.to_param, :components_pedal => @components_pedal.attributes
    assert_redirected_to components_pedal_path(assigns(:components_pedal))
  end

  test "should destroy components_pedal" do
    assert_difference('Components::Pedal.count', -1) do
      delete :destroy, :id => @components_pedal.to_param
    end

    assert_redirected_to components_pedals_path
  end
end
