gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class Node_Test < Minitest::Test
  def test_it_has_a_surname
    # skip
    node = Node.new("Burke")
    assert_equal "Burke", node.surname
  end

  def test_it_has_a_next_node
    # skip
    node = Node.new("West")
    assert_equal nil, node.next_node
  end

end

# > require "./lib/node"
# > node = Node.new("Burke")
# => <Node @surname="Burke" @next_node=nil #5678904567890>
# > node.surname
# => "Burke"
# > node.next_node
# => nil
