require 'test_helper'

class TagTest < ActiveSupport::TestCase
  setup do
    @tag = tags(:one)
  end

  test "fixture works" do
    assert @tag.save
  end

  test "requires tag to be present" do
    t = Tag.new()
    assert_not t.save

    t = Tag.new(value: "a tag")
    assert t.save
  end

  test "tag belongs to a type" do
    type = types(:type1)
    t = Tag.new(value: "a tag")
    t.type = type
    assert t.save
  end
  # test "the truth" do
  #   assert true
  # end
end
