#Exercise 1
class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

#Exercise 2
class Queue
  def initialize
    @queue = []
  end

  def enqueque(el)
    @queue.unshift(el)
    el
  end

  def dequeue
    @queue.pop
  end

  def show
    @queue.dup
  end
end

#Exercise 3
class Map
  def initialize
    @map = []
  end

  def assign(key, val)
    @map << [key, val]
  end

  def lookup(user_key)
    @map.each do |key, val|
      return [key, val] if user_key == key
    end
  end

  def remove(key)
    @map.each { |k, v| @map.delete([ k, v]) if key == k }
  end

  def show
    @map.dup
  end
end
