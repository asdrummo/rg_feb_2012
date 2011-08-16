require 'test_helper'

class Components::ChainsControllerTest < ActionController::TestCase
  setup do
    @components_chain = components_chains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_chains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_chain" do
    assert_difference('Components::Chain.count') do
      post :create, :components_chain => @components_chain.attributes
    end

    assert_redirected_to components_chain_path(assigns(:components_chain))
  end

  test "should show components_chain" do
    get :show, :id => @components_chain.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @components_chain.to_param
    assert_response :success
  end

  test "should update components_chain" do
    put :update, :id => @components_chain.to_param, :components_chain => @components_chain.attributes
    assert_redirected_to components_chain_path(assigns(:components_chain))
  end

  test "should destroy components_chain" do
    assert_difference('Components::Chain.count', -1) do
      delete :destroy, :id => @components_chain.to_param
    end

    assert_redirected_to components_chains_path
  end
end
