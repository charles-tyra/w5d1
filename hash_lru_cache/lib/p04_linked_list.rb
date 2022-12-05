class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @next.prev = @prev
    @prev.next = @next
  end
end

class LinkedList
include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    iternode = @head.next
    count = 0
    while iternode != @tail
      return count if key == iternode.key
      iternode = iternode.next
      count += 1
    end
    nil
  end

  def include?(key)
    iternode = @head.next
    while iternode != @tail
      return true if key == iternode
      iternode = iternode.next
    end
    false
  end

  def append(key, val)
    noodle = Node.new(key, val)
    noodle.prev = @tail.prev
    @tail.prev.next = noodle
    @tail.prev = noodle
  end

  def update(key, val)
  end

  def remove(key)
    iternode = @head.next
    count = 0
    while iternode != @tail
      if iternode == key
        key.remove
        return count
      end
      iternode = iternode.next
      count += 1
    end
  end

  def each
    iternode = @head.next
    while iternode != @tail
      iternode = iternode.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
