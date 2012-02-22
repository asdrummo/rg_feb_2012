require 'test_helper'

class Components::SeatPostsControllerTest < ActionController::TestCase
  setup do
    @components_seat_post = components_seat_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_seat_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_seat_post" do
    assert_difference('Components::SeatPost.count') do
      post :create, :components_seat_post => @components_seat_post.attributes
    end

    assert_redirected_to components_seat_post_path(assigns(:components_seat_post))
  end

  test "should show components_seat_post" do
    get :show, :id => @components_seat_post.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_seat_post.to_param
    assert_response :success
  end

  test "should update components_seat_post" do
    put :update, :id => @components_seat_post.to_param, :components_seat_post => @components_seat_post.attributes
    assert_redirected_to components_seat_post_path(assigns(:components_seat_post))
  end

  test "should destroy components_seat_post" do
    assert_difference('Components::SeatPost.count', -1) do
      delete :destroy, :id => @components_seat_post.to_param
    end

    assert_redirected_to components_seat_posts_path
  end
end
