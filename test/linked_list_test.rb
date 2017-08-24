require 'pry'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'

class LinkedListTest < Minitest::Test
  def test_it_exists
    list = LinkedList.new

    assert_instance_of LinkedList, list
  end

  def test_starts_with_no_head
    # skip
    list = LinkedList.new

    assert_nil nil, list.head
  end

  def test_it_appends
    # skip
    list = LinkedList.new
    list.append("West")

    assert_equal "West", list.head.surname
  end

  def test_it_counts
    # skip
    list = LinkedList.new
    list.append("east")

    assert_equal 1, list.count
  end

  def test_does_it_turn_to_string
    #skip
    list = LinkedList.new
    list.append("East")

    assert_equal "The East family", list.turn_to_string
  end

  def test_attach_to_the_end
    # skip
    list = LinkedList.new
    list.append("East")
    list.append("South")

    assert_equal "The East family, followed by the South family", list.turn_to_string
  end

  def test_if_it_inserts
    # skip
    list = LinkedList.new
    list.append("East")
    list.append("West")
    list.insert(1, "Lawson")
    assert_equal "Lawson", list.head.next_node.surname
  end

  def test_prepend_adds_to_beginning
    # skip
    list = LinkedList.new
    list.prepend("Alice")
    assert_equal "Alice", list.head.surname
    list.prepend("Iza")
    assert_equal "Iza", list.head.surname
  end

  def test_find_can_find_family
    # skip
    list = LinkedList.new
    list.append("Pickles")
    list.append("Lawson")
    list.append("Brooks")
    list.append("Henderson")
    assert_equal "The Brooks family", list.find(2, 1)
    assert_equal "The Lawson family, followed by the Brooks family, followed by the Henderson family", list.find(1, 3)
  end

  def test_it_includes_a_family
    # skip
    list = LinkedList.new
    refute list.includes?("Wicks")
    list.append("Wicks")
    assert list.includes?("Wicks")
    end
end
