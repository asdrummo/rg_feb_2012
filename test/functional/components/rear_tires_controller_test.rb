require 'test_helper'

class Components::RearTiresControllerTest < ActionController::TestCase
  setup do
    @components_rear_tire = components_rear_tires(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_rear_tires)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_rear_tire" do
    assert_difference('Components::RearTire.count') do
      post :create, :components_rear_tire => @components_rear_tire.attributes
    end

    assert_redirected_to components_rear_tire_path(assigns(:components_rear_tire))
  end

  test "should show components_rear_tire" do
    get :show, :id => @components_rear_tire.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_rear_tire.to_param
    assert_response :success
  end

  test "should update components_rear_tire" do
    put :update, :id => @components_rear_tire.to_param, :components_rear_tire => @components_rear_tire.attributes
    assert_redirected_to components_rear_tire_path(assigns(:components_rear_tire))
  end

  test "should destroy components_rear_tire" do
    assert_difference('Components::RearTire.count', -1) do
      delete :destroy, :id => @components_rear_tire.to_param
    end

    assert_redirected_to components_rear_tires_path
  end
end
