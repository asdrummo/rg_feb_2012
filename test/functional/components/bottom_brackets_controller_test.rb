require 'test_helper'

class Components::BottomBracketsControllerTest < ActionController::TestCase
  setup do
    @components_bottom_bracket = components_bottom_brackets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_bottom_brackets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_bottom_bracket" do
    assert_difference('Components::BottomBracket.count') do
      post :create, :components_bottom_bracket => @components_bottom_bracket.attributes
    end

    assert_redirected_to components_bottom_bracket_path(assigns(:components_bottom_bracket))
  end

  test "should show components_bottom_bracket" do
    get :show, :id => @components_bottom_bracket.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_bottom_bracket.to_param
    assert_response :success
  end

  test "should update components_bottom_bracket" do
    put :update, :id => @components_bottom_bracket.to_param, :components_bottom_bracket => @components_bottom_bracket.attributes
    assert_redirected_to components_bottom_bracket_path(assigns(:components_bottom_bracket))
  end

  test "should destroy components_bottom_bracket" do
    assert_difference('Components::BottomBracket.count', -1) do
      delete :destroy, :id => @components_bottom_bracket.to_param
    end

    assert_redirected_to components_bottom_brackets_path
  end
end
