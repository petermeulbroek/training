require 'test_helper'

class ShapeTest < ActiveSupport::TestCase
  setup do
    @shape = shapes(:shape1)
  end

  test "fixture works" do
    assert @shape.save
  end

  test "all coordinates much be present" do
    s = Shape.new(x: 0, y: 0, width: 100)
    assert_not s.save
    
    s = Shape.new(x: 0, y: 0, width: 100, height: 100)
    assert s.save

  end
  test "all coordinates must be positive" do
    s = Shape.new(x: 0, y: 0, width: 100, height: -100)
    assert_not s.save

    s = Shape.new(x: 0, y: 0, width: 100, height: 100)
    assert s.save
  end
  
  # test "the truth" do
  #   assert true
  # end
end
