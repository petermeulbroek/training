require 'test_helper'

class ImageTagTest < ActiveSupport::TestCase
  setup do
    @image_tag = image_tags(:one)
  end

  test "fixture works" do
    assert @image_tag.save
  end

  test "requires name to be present" do
    t = ImageTag.new(value: "foo")
    assert_not t.save

    t = ImageTag.new(name: "bar", value: "foo")
    assert t.save
  end

    test "requires value to be present" do
    t = ImageTag.new(name: "foo")
    assert_not t.save

    t = ImageTag.new(name: "foo", value: "bar")
    assert t.save
  end

  test "image_tag belongs to an image" do
    image = images(:one)
    t = ImageTag.new(name: "foo", value: "bar")
    t.image = image
    assert t.save
  end
  # test "the truth" do
  #   assert true
  # end
end
