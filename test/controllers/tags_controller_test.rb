require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  setup do
    @tag = tags(:one)
    @selection = selections(:selection1)
  end

  test "should get index" do
    get :index, selection_id: @selection
    assert_response :success
    assert_not_nil assigns(:tags)
  end

  test "should get new" do
    get :new, selection_id: @selection, type_id: types(:type1)
    assert_response :success
  end

  test "should create tag" do
    assert_difference('Tag.count') do
      post :create, selection_id: @selection, tag: { type_id: @tag.type_id, value: @tag.value }
    end

    assert_redirected_to tag_path(assigns(:tag))
  end

  test "should show tag" do
    get :show, id: @tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tag
    assert_response :success
  end

  test "should update tag" do
    patch :update, selection_id: @selection, id: @tag, section_id: @section, tag: { type_id: @tag.type_id, value: @tag.value }
    assert_redirected_to tag_path(assigns(:tag))
  end

  test "should destroy tag" do
    assert_difference('Tag.count', -1) do
      delete :destroy, id: @tag
    end

    assert_redirected_to selection_tags_path(@tag.selection)
  end
end
