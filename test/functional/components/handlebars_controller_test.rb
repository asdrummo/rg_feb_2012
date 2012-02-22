require 'test_helper'

class Components::HandlebarsControllerTest < ActionController::TestCase
  setup do
    @components_handlebar = components_handlebars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_handlebars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_handlebar" do
    assert_difference('Components::Handlebar.count') do
      post :create, :components_handlebar => @components_handlebar.attributes
    end

    assert_redirected_to components_handlebar_path(assigns(:components_handlebar))
  end

  test "should show components_handlebar" do
    get :show, :id => @components_handlebar.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_handlebar.to_param
    assert_response :success
  end

  test "should update components_handlebar" do
    put :update, :id => @components_handlebar.to_param, :components_handlebar => @components_handlebar.attributes
    assert_redirected_to components_handlebar_path(assigns(:components_handlebar))
  end

  test "should destroy components_handlebar" do
    assert_difference('Components::Handlebar.count', -1) do
      delete :destroy, :id => @components_handlebar.to_param
    end

    assert_redirected_to components_handlebars_path
  end
end
