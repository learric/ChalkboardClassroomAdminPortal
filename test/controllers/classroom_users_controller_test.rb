require 'test_helper'

class ClassroomUsersControllerTest < ActionController::TestCase
  setup do
    @classroom_user = classroom_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:classroom_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create classroom_user" do
    assert_difference('ClassroomUser.count') do
      post :create, classroom_user: {  }
    end

    assert_redirected_to classroom_user_path(assigns(:classroom_user))
  end

  test "should show classroom_user" do
    get :show, id: @classroom_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @classroom_user
    assert_response :success
  end

  test "should update classroom_user" do
    patch :update, id: @classroom_user, classroom_user: {  }
    assert_redirected_to classroom_user_path(assigns(:classroom_user))
  end

  test "should destroy classroom_user" do
    assert_difference('ClassroomUser.count', -1) do
      delete :destroy, id: @classroom_user
    end

    assert_redirected_to classroom_users_path
  end
end
