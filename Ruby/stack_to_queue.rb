# The goal is to simulate the Deque() and Enque() behavior of a Queue using Pop() and Push()

class MyQueue
  attr_accessor :myOutStack

  def initialize()
    @myInStack = []
    @myOutStack = []
  end

  def enque(n)
    @myInStack.push(n)
  end

  def deque
    if @myOutStack.empty?
      @myOutStack.push(@myInStack.pop) while !@myInStack.empty?
    end
    @myOutStack.pop
  end
end

myQueue = MyQueue.new
myQueue.enque(1)
myQueue.enque(2)
myQueue.enque(3)
puts myQueue.deque == 1
myQueue.enque(4)
puts myQueue.myOutStack == [3, 2]
puts myQueue.deque == 2
puts myQueue.deque == 3
puts myQueue.deque == 4
puts myQueue.deque == nil