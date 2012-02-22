require 'test_helper'

class Components::CranksControllerTest < ActionController::TestCase
  setup do
    @components_crank = components_cranks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_cranks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_crank" do
    assert_difference('Components::Crank.count') do
      post :create, :components_crank => @components_crank.attributes
    end

    assert_redirected_to components_crank_path(assigns(:components_crank))
  end

  test "should show components_crank" do
    get :show, :id => @components_crank.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_crank.to_param
    assert_response :success
  end

  test "should update components_crank" do
    put :update, :id => @components_crank.to_param, :components_crank => @components_crank.attributes
    assert_redirected_to components_crank_path(assigns(:components_crank))
  end

  test "should destroy components_crank" do
    assert_difference('Components::Crank.count', -1) do
      delete :destroy, :id => @components_crank.to_param
    end

    assert_redirected_to components_cranks_path
  end
end
