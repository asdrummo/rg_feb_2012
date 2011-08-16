require 'test_helper'

class Components::StemsControllerTest < ActionController::TestCase
  setup do
    @components_stem = components_stems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_stems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_stem" do
    assert_difference('Components::Stem.count') do
      post :create, :components_stem => @components_stem.attributes
    end

    assert_redirected_to components_stem_path(assigns(:components_stem))
  end

  test "should show components_stem" do
    get :show, :id => @components_stem.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_stem.to_param
    assert_response :success
  end

  test "should update components_stem" do
    put :update, :id => @components_stem.to_param, :components_stem => @components_stem.attributes
    assert_redirected_to components_stem_path(assigns(:components_stem))
  end

  test "should destroy components_stem" do
    assert_difference('Components::Stem.count', -1) do
      delete :destroy, :id => @components_stem.to_param
    end

    assert_redirected_to components_stems_path
  end
end
