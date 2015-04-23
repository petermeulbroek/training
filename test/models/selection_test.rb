require 'test_helper'

class SelectionTest < ActiveSupport::TestCase

  setup do
    @selection = selections(:selection1)
  end

  test "fixture works" do
    assert @selection.save
  end
  
  test "all coordinates much be present" do
    s = Selection.new(start_x: 0, start_y: 0, end_y: 100)
    assert_not s.save
    
    s = Selection.new(start_x: 0, start_y: 0, end_x: 100, end_y: 100)
    assert s.save

  end
  test "all coordinates must be positive" do
    s = Selection.new(start_x: 0, start_y: 0, end_x: -100, end_y: 100)
    assert_not s.save
    
    s = Selection.new(start_x: 0, start_y: 0, end_x: 100, end_y: 100)
    assert s.save

  end
  
  # test "the truth" do
  #   assert true
  # end
end
