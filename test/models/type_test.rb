require 'test_helper'

class TypeTest < ActiveSupport::TestCase
  setup do
    @type = types(:type1)
  end

  test "fixture works" do
    assert @type.save
  end

  test "requires type to be present" do
    t = Type.new()
    assert_not t.save

    t = Type.new(name: "a tag")
    assert t.save
  end

  # test "the truth" do
  #   assert true
  # end
end
