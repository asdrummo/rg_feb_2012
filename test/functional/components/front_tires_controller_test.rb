require 'test_helper'

class Components::FrontTiresControllerTest < ActionController::TestCase
  setup do
    @components_front_tire = components_front_tires(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_front_tires)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_front_tire" do
    assert_difference('Components::FrontTire.count') do
      post :create, :components_front_tire => @components_front_tire.attributes
    end

    assert_redirected_to components_front_tire_path(assigns(:components_front_tire))
  end

  test "should show components_front_tire" do
    get :show, :id => @components_front_tire.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_front_tire.to_param
    assert_response :success
  end

  test "should update components_front_tire" do
    put :update, :id => @components_front_tire.to_param, :components_front_tire => @components_front_tire.attributes
    assert_redirected_to components_front_tire_path(assigns(:components_front_tire))
  end

  test "should destroy components_front_tire" do
    assert_difference('Components::FrontTire.count', -1) do
      delete :destroy, :id => @components_front_tire.to_param
    end

    assert_redirected_to components_front_tires_path
  end
end
