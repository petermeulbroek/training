require 'test_helper'

class AnnotationsControllerTest < ActionController::TestCase
  setup do
    @annotation = annotations(:annotation1)
    @shape = shapes(:shape1)
    @image = images(:image1)
  end

  test "should get index" do
    get :index, image_id: @image
    assert_response :success
    assert_not_nil assigns(:annotations)
  end

  test "should get new" do
    get :new, image_id: @image
    assert_response :success
  end

  test "should create annotation" do

    shapes_array = [
                    {
                     "type" => "rect",
                     "geometry" =>
                       {
                        "x" => 0.4849699398797595,
                        "y"=> 0.5192307692307693,
                        "width" => 0.47695390781563124,
                        "height"=>0.44711538461538464
                       }
                    }
                   ]
  
    assert_difference('Annotation.count') do
      post :create, image_id: @image, annotation: { src: @annotation.src, text: @annotation.text, shapes: shapes_array }
    end

    assert_redirected_to annotation_path(assigns(:annotation))
  end

  test "should show annotation" do
    get :show, id: @annotation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @annotation
    assert_response :success
  end

  test "should update annotation" do
    patch :update, id: @annotation, image_id: @annotation.image, annotation: { src: @annotation.src, text: @annotation.text }
    assert_redirected_to annotation_path(assigns(:annotation))
  end

  test "should destroy annotation" do
    assert_difference('Annotation.count', -1) do
      delete :destroy, id: @annotation
    end

    assert_redirected_to image_annotations_path(@image)
  end
end
