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
