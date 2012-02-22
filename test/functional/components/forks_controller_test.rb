require 'test_helper'

class Components::ForksControllerTest < ActionController::TestCase
  setup do
    @components_fork = components_forks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_forks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_fork" do
    assert_difference('Components::Fork.count') do
      post :create, :components_fork => @components_fork.attributes
    end

    assert_redirected_to components_fork_path(assigns(:components_fork))
  end

  test "should show components_fork" do
    get :show, :id => @components_fork.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_fork.to_param
    assert_response :success
  end

  test "should update components_fork" do
    put :update, :id => @components_fork.to_param, :components_fork => @components_fork.attributes
    assert_redirected_to components_fork_path(assigns(:components_fork))
  end

  test "should destroy components_fork" do
    assert_difference('Components::Fork.count', -1) do
      delete :destroy, :id => @components_fork.to_param
    end

    assert_redirected_to components_forks_path
  end
end
