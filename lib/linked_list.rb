require 'pry'
require './lib/node'

class LinkedList
  attr_reader :head, :count, :next_node
  def initialize
    @head = nil
    @count = 0
  end

#need to add a new node with a surname
  def append(surname)
    node = Node.new(surname)
    add_to_count
    if head == nil
      @head = node
    else
      attach(@head, node)
    end
  end

#checking each wagon for the one with nothing behind it
  def attach(head, node)
    if head.next_node == nil
      head.next_node = node
    else
      #keep going
      attach(head.next_node, node)
    end
  end
#plus 1 for everynew node
  def add_to_count
    @count += 1
  end
#concatenating families together until I've reached the last node
  def turn_to_string
    caravan = "The #{head.surname} family"
    current = head.next_node
    until current == nil do
      caravan.concat(", followed by the #{current.surname} family")
      current = current.next_node
    end
    return caravan
  end
#add a family to beginning of the caravan
  def prepend(surname)
    new_node = Node.new(surname)
    add_to_count
    if @head == nil
      @head = new_node
    else
      #attach current head to come after new node, then add new node as head.
      new_node.next_node = head
      @head = new_node
    end
    return new_node
  end

#attach family in the actual position using [position-1]
  def insert(position, surname)
    new_node = Node.new(surname)
    current = self[position-1] #self is [] method
    add_to_count
    saved_node = current.next_node
    current.next_node = new_node
    new_node.next_node = saved_node
    return new_node
  end

  def [](position)
    #How to get to specific node. self method
    current = @head
    if current == nil
      return nil
    end
    position.times do
      if current.next_node != nil
        current = current.next_node #traveling down the caravan
      else
        return nil
      end
    end
    return current
  end

#print out a string including the selected family and number of families after
  def find(position, number_of_families)
    current = self[position]
    if current == nil
      return nil
    end
    caravan = "The #{current.surname} family"
    (number_of_families-1).times do
      current = current.next_node
      caravan.concat(", followed by the #{current.surname} family")
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
        #keep going in loop
        current = current.next_node
      end
      #if haven't been found
      return false
    end
  end
end
