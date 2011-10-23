require 'test_helper'

class StatushackrelationsControllerTest < ActionController::TestCase
  setup do
    @statushackrelation = statushackrelations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statushackrelations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create statushackrelation" do
    assert_difference('Statushackrelation.count') do
      post :create, :statushackrelation => @statushackrelation.attributes
    end

    assert_redirected_to statushackrelation_path(assigns(:statushackrelation))
  end

  test "should show statushackrelation" do
    get :show, :id => @statushackrelation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @statushackrelation.to_param
    assert_response :success
  end

  test "should update statushackrelation" do
    put :update, :id => @statushackrelation.to_param, :statushackrelation => @statushackrelation.attributes
    assert_redirected_to statushackrelation_path(assigns(:statushackrelation))
  end

  test "should destroy statushackrelation" do
    assert_difference('Statushackrelation.count', -1) do
      delete :destroy, :id => @statushackrelation.to_param
    end

    assert_redirected_to statushackrelations_path
  end
end
