require "./set"
require "test/unit"

class SetTest < Test::Unit::TestCase
  def setup
    @set = Set.new
  end

  def test_starts_empty
    assert_equal 0, @set.size
    assert @set.empty?
  end

  def test_changes_length_when_adding_items
    @set << 1
    @set << 2
    assert_equal 2, @set.size
  end

  def test_rejects_duplicated_items
    @set << 1
    @set << 1
    assert_equal 1, @set.size
  end

  def test_implements_each
    result = []

    @set << 1
    @set << 2

    @set.each { |i| result << i }

    assert_equal [1,2], result
  end

  def test_implements_map
    @set << 1
    @set << 2

    result = @set.map { |i| i * 2 }

    assert_equal [2,4], result
  end
end