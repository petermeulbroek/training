require 'test_helper'

class SelectionsControllerTest < ActionController::TestCase
  setup do
    @selection = selections(:selection1)
  end

  test "should get index" do
    get :index, image_id: @selection.image
    assert_response :success
    assert_not_nil assigns(:selections)
  end

  test "should get new" do
    get :new, image_id: @selection.image
    assert_response :success
  end

  test "should create selection" do
    assert_difference('Selection.count') do
      post :create, image_id: @selection.image, selection: { end_x: @selection.end_x, end_y: @selection.end_y, start_x: @selection.start_x, start_y: @selection.start_y }
    end

    assert_redirected_to image_path @selection.image # , assigns(:selection)
  end

  test "should show selection" do
    get :show, id: @selection, image_id: @selection.image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selection, image_id: @selection.image
    assert_response :success
  end

  test "should update selection" do
    patch :update, image_id: @selection.image, id: @selection, selection: { end_x: @selection.end_x, end_y: @selection.end_y, start_x: @selection.start_x, start_y: @selection.start_y }
    assert_redirected_to image_path @selection.image #, assigns(:selection)
  end

  test "should destroy selection" do
    assert_difference('Selection.count', -1) do
      delete :destroy, id: @selection, image_id: @selection.image
    end

    assert_redirected_to image_path(@selection.image)
  end
end
