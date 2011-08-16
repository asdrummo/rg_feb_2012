require 'test_helper'

class AccessoriesControllerTest < ActionController::TestCase
  setup do
    @accessory = accessories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accessories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accessory" do
    assert_difference('Accessory.count') do
      post :create, :accessory => @accessory.attributes
    end

    assert_redirected_to accessory_path(assigns(:accessory))
  end

  test "should show accessory" do
    get :show, :id => @accessory.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @accessory.to_param
    assert_response :success
  end

  test "should update accessory" do
    put :update, :id => @accessory.to_param, :accessory => @accessory.attributes
    assert_redirected_to accessory_path(assigns(:accessory))
  end

  test "should destroy accessory" do
    assert_difference('Accessory.count', -1) do
      delete :destroy, :id => @accessory.to_param
    end

    assert_redirected_to accessories_path
  end
end
