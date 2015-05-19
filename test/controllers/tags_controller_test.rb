require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  setup do
    @tag = tags(:one)
    @image = images(:image1)
  end

  test "should get index" do
    get :index, image_id: @image
    assert_response :success
    assert_not_nil assigns(:tags)
  end

  test "should get new" do
    get :new, image_id: @image, type_id: types(:type1)
    assert_response :success
  end

  test "should create tag" do
    assert_difference('Tag.count') do
      post :create, image_id: @image, tag: { type_id: @tag.type_id, value: @tag.value }
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
    patch :update, image_id: @image, id: @tag, section_id: @section, tag: { type_id: @tag.type_id, value: @tag.value }
    assert_redirected_to tag_path(assigns(:tag))
  end

  test "should destroy tag" do
    assert_difference('Tag.count', -1) do
      delete :destroy, id: @tag
    end

    assert_redirected_to image_tags_path(@tag.image)
  end
end
