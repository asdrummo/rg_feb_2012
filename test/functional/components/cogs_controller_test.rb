require 'test_helper'

class Components::CogsControllerTest < ActionController::TestCase
  setup do
    @components_cog = components_cogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_cogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_cog" do
    assert_difference('Components::Cog.count') do
      post :create, :components_cog => @components_cog.attributes
    end

    assert_redirected_to components_cog_path(assigns(:components_cog))
  end

  test "should show components_cog" do
    get :show, :id => @components_cog.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_cog.to_param
    assert_response :success
  end

  test "should update components_cog" do
    put :update, :id => @components_cog.to_param, :components_cog => @components_cog.attributes
    assert_redirected_to components_cog_path(assigns(:components_cog))
  end

  test "should destroy components_cog" do
    assert_difference('Components::Cog.count', -1) do
      delete :destroy, :id => @components_cog.to_param
    end

    assert_redirected_to components_cogs_path
  end
end
