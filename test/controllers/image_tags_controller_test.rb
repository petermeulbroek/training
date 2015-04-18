require 'test_helper'

class ImageTagsControllerTest < ActionController::TestCase
  setup do
    @image_tag = image_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image_tag" do
    assert_difference('ImageTag.count') do
      post :create, image_tag: { image_id: @image_tag.image_id, name: @image_tag.name, value: @image_tag.value }
    end

    assert_redirected_to image_tag_path(assigns(:image_tag))
  end

  test "should show image_tag" do
    get :show, id: @image_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image_tag
    assert_response :success
  end

  test "should update image_tag" do
    patch :update, id: @image_tag, image_tag: { image_id: @image_tag.image_id, name: @image_tag.name, value: @image_tag.value }
    assert_redirected_to image_tag_path(assigns(:image_tag))
  end

  test "should destroy image_tag" do
    assert_difference('ImageTag.count', -1) do
      delete :destroy, id: @image_tag
    end

    assert_redirected_to image_tags_path
  end
end
