require 'test_helper'

class HackdescriptionsControllerTest < ActionController::TestCase
  setup do
    @hackdescription = hackdescriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hackdescriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hackdescription" do
    assert_difference('Hackdescription.count') do
      post :create, :hackdescription => @hackdescription.attributes
    end

    assert_redirected_to hackdescription_path(assigns(:hackdescription))
  end

  test "should show hackdescription" do
    get :show, :id => @hackdescription.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @hackdescription.to_param
    assert_response :success
  end

  test "should update hackdescription" do
    put :update, :id => @hackdescription.to_param, :hackdescription => @hackdescription.attributes
    assert_redirected_to hackdescription_path(assigns(:hackdescription))
  end

  test "should destroy hackdescription" do
    assert_difference('Hackdescription.count', -1) do
      delete :destroy, :id => @hackdescription.to_param
    end

    assert_redirected_to hackdescriptions_path
  end
end
