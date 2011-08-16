require 'test_helper'

class SeatPostsControllerTest < ActionController::TestCase
  setup do
    @seat_post = seat_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seat_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seat_post" do
    assert_difference('SeatPost.count') do
      post :create, :seat_post => @seat_post.attributes
    end

    assert_redirected_to seat_post_path(assigns(:seat_post))
  end

  test "should show seat_post" do
    get :show, :id => @seat_post.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @seat_post.to_param
    assert_response :success
  end

  test "should update seat_post" do
    put :update, :id => @seat_post.to_param, :seat_post => @seat_post.attributes
    assert_redirected_to seat_post_path(assigns(:seat_post))
  end

  test "should destroy seat_post" do
    assert_difference('SeatPost.count', -1) do
      delete :destroy, :id => @seat_post.to_param
    end

    assert_redirected_to seat_posts_path
  end
end
