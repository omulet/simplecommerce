require 'test_helper'

class ProdusControllerTest < ActionController::TestCase
  setup do
    @produ = produs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:produs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create produ" do
    assert_difference('Produ.count') do
      post :create, :produ => @produ.attributes
    end

    assert_redirected_to produ_path(assigns(:produ))
  end

  test "should show produ" do
    get :show, :id => @produ.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @produ.to_param
    assert_response :success
  end

  test "should update produ" do
    put :update, :id => @produ.to_param, :produ => @produ.attributes
    assert_redirected_to produ_path(assigns(:produ))
  end

  test "should destroy produ" do
    assert_difference('Produ.count', -1) do
      delete :destroy, :id => @produ.to_param
    end

    assert_redirected_to produs_path
  end
end
