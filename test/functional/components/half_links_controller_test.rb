require 'test_helper'

class Components::HalfLinksControllerTest < ActionController::TestCase
  setup do
    @components_half_link = components_half_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_half_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_half_link" do
    assert_difference('Components::HalfLink.count') do
      post :create, :components_half_link => @components_half_link.attributes
    end

    assert_redirected_to components_half_link_path(assigns(:components_half_link))
  end

  test "should show components_half_link" do
    get :show, :id => @components_half_link.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_half_link.to_param
    assert_response :success
  end

  test "should update components_half_link" do
    put :update, :id => @components_half_link.to_param, :components_half_link => @components_half_link.attributes
    assert_redirected_to components_half_link_path(assigns(:components_half_link))
  end

  test "should destroy components_half_link" do
    assert_difference('Components::HalfLink.count', -1) do
      delete :destroy, :id => @components_half_link.to_param
    end

    assert_redirected_to components_half_links_path
  end
end
