require 'test_helper'

class TeachersControllerTest < ActionController::TestCase
  setup do
    @teacher = teachers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teachers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher" do
    assert_difference('Teacher.count') do
      post :create, teacher: { classroom_description: @teacher.classroom_description, classroom_location: @teacher.classroom_location, classroom_name: @teacher.classroom_name, name_first: @teacher.name_first, name_last: @teacher.name_last, name_prefix: @teacher.name_prefix, school_city: @teacher.school_city, school_location: @teacher.school_location, school_name: @teacher.school_name, school_state: @teacher.school_state }
    end

    assert_redirected_to teacher_path(assigns(:teacher))
  end

  test "should show teacher" do
    get :show, id: @teacher
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teacher
    assert_response :success
  end

  test "should update teacher" do
    patch :update, id: @teacher, teacher: { classroom_description: @teacher.classroom_description, classroom_location: @teacher.classroom_location, classroom_name: @teacher.classroom_name, name_first: @teacher.name_first, name_last: @teacher.name_last, name_prefix: @teacher.name_prefix, school_city: @teacher.school_city, school_location: @teacher.school_location, school_name: @teacher.school_name, school_state: @teacher.school_state }
    assert_redirected_to teacher_path(assigns(:teacher))
  end

  test "should destroy teacher" do
    assert_difference('Teacher.count', -1) do
      delete :destroy, id: @teacher
    end

    assert_redirected_to teachers_path
  end
end
