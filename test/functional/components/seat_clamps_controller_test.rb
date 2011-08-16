require 'test_helper'

class Components::SeatClampsControllerTest < ActionController::TestCase
  setup do
    @components_seat_clamp = components_seat_clamps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_seat_clamps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_seat_clamp" do
    assert_difference('Components::SeatClamp.count') do
      post :create, :components_seat_clamp => @components_seat_clamp.attributes
    end

    assert_redirected_to components_seat_clamp_path(assigns(:components_seat_clamp))
  end

  test "should show components_seat_clamp" do
    get :show, :id => @components_seat_clamp.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_seat_clamp.to_param
    assert_response :success
  end

  test "should update components_seat_clamp" do
    put :update, :id => @components_seat_clamp.to_param, :components_seat_clamp => @components_seat_clamp.attributes
    assert_redirected_to components_seat_clamp_path(assigns(:components_seat_clamp))
  end

  test "should destroy components_seat_clamp" do
    assert_difference('Components::SeatClamp.count', -1) do
      delete :destroy, :id => @components_seat_clamp.to_param
    end

    assert_redirected_to components_seat_clamps_path
  end
end
