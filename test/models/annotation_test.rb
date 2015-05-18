require 'test_helper'

class AnnotationTest < ActiveSupport::TestCase
    setup do
    @annotation = annotations(:annotation1)
  end

  test "fixture works" do
    assert @annotation.save
  end
  
  test "text must be present" do 
    s = Annotation.new()
    assert_not s.save
    
    s = Annotation.new(text: "hi")
    assert s.save

  end
  test "adding a shape works" do 
    s = shapes(:shape1)
    @annotation.shapes << s
    assert @annotation.save
    
  end
  

  # test "the truth" do
  #   assert true
  # end
end
