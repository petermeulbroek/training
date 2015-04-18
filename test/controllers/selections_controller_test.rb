require 'test_helper'

class SelectionsControllerTest < ActionController::TestCase
  setup do
    @selection = selections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selection" do
    assert_difference('Selection.count') do
      post :create, selection: { end_x: @selection.end_x, end_y: @selection.end_y, start_x: @selection.start_x, start_y: @selection.start_y }
    end

    assert_redirected_to selection_path(assigns(:selection))
  end

  test "should show selection" do
    get :show, id: @selection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selection
    assert_response :success
  end

  test "should update selection" do
    patch :update, id: @selection, selection: { end_x: @selection.end_x, end_y: @selection.end_y, start_x: @selection.start_x, start_y: @selection.start_y }
    assert_redirected_to selection_path(assigns(:selection))
  end

  test "should destroy selection" do
    assert_difference('Selection.count', -1) do
      delete :destroy, id: @selection
    end

    assert_redirected_to selections_path
  end
end
