require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  setup do
    @image = images(:image1)
  end

  test "fixture is valid" do
    @image.save
  end
  
  test "requires url" do
    i = Image.new(reviewed: false)
    assert_not i.save
  end
  
  test "url must be unique" do
    @image.save
    i = Image.new(url: @image.url, reviewed: false)
    assert_not i.save
  end
  
  test "requires reviewed" do
    i = Image.new(url: "test")
    assert_not i.save

  end


  # test "the truth" do
  #   assert true
  # end
end
