require 'test_helper'

class Components::ChainringsControllerTest < ActionController::TestCase
  setup do
    @components_chainring = components_chainrings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_chainrings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_chainring" do
    assert_difference('Components::Chainring.count') do
      post :create, :components_chainring => @components_chainring.attributes
    end

    assert_redirected_to components_chainring_path(assigns(:components_chainring))
  end

  test "should show components_chainring" do
    get :show, :id => @components_chainring.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_chainring.to_param
    assert_response :success
  end

  test "should update components_chainring" do
    put :update, :id => @components_chainring.to_param, :components_chainring => @components_chainring.attributes
    assert_redirected_to components_chainring_path(assigns(:components_chainring))
  end

  test "should destroy components_chainring" do
    assert_difference('Components::Chainring.count', -1) do
      delete :destroy, :id => @components_chainring.to_param
    end

    assert_redirected_to components_chainrings_path
  end
end
