require 'pry'
require './lib/node'

class LinkedList
  attr_reader :head, :count, :next_node
  def initialize
    @head = nil
    @count = 0
  end

  def append(surname)
    node = Node.new(surname)
    add_to_count
    if head == nil
      @head = node
    else
      attach(@head, node)
    end
  end

  def attach(head, node)
    if head.next_node == nil
      head.next_node = node
    else
      attach(head.next_node, node)
    end
  end

  def add_to_count
    @count += 1
  end

  def turn_to_string
    caravan = "The #{head.surname} family"
    current = head.next_node
    until current == nil do
      caravan.concat(", followed by the #{current.surname} family")
      current = current.next_node
    end
    return caravan
  end

  def prepend(surname)
    new_node = Node.new(surname)
    add_to_count
    if @head == nil
      @head = new_node
    else
      new_node.next_node = head
      @head = new_node
    end
    return new_node
  end


  def insert(position, surname)
    new_node = Node.new(surname)
    head = self[position-1]
    add_to_count
    saved_node = head.next_node
    head.next_node = new_node
    new_node.next_node = saved_node
    return new_node
  end

  def [](position)
    current = @head
    if current == nil
      return nil
    end
    position.times do
      if current.next_node != nil
        current = current.next_node
      else
        return nil
      end
    end
    return current
  end

  def find(position, number_of_families)
    head = self[position]
    if head == nil
      return nil
    end
    caravan = "The #{head.surname} family"
    (number_of_families-1).times do
      head = head.next_node
      caravan.concat(", followed by the #{head.surname} family")
    end
    return caravan
  end

  def includes?(surname)
    #start at the head
    current = head
    #go to every node
    until current == nil
      #if I find it matches current's surname
      if current.surname == surname
        return true
      else
        #keep going
        current = current.next_node
      end
      #if haven't been found
      return false
    end
  end
end
