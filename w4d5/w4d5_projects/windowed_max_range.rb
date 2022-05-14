# PHASE 1

def windowed_max_range(arr, window)
    current_max_range = arr.min
    arr.each_with_index do |ele, idx|
      min = arr[idx...idx+window].min
      max = arr[idx...idx+window].max  
      if max - min > current_max_range
      current_max_range = max - min
    end
  end
  current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2)# == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3)# == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4)# == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5)# == 6 # 3, 2, 5, 4, 8

class MyQueue
    def initialize
        @store = []
    end

    def peek
        return @store[0]
    end

    def size
        return @store.length
    end

    def empty?
        return true if @store.length == 0
    end
    
    def enqueue(ele)
        @store.push(ele)
    end
    
    def dequeue
        @store.shift
    end
end

class MyStack
    def initialize
        @store = []
    end

    def peek
        return @store[-1]
    end

    def size
        return @store.length
    end
    
    def empty?
        return true if @store.length == 0
    end
    
    def enqueue(ele)
        @store.push(ele)
    end
    
    def dequeue
        @store.pop
    end
end

class StackQueue

    def initialize
        @push_stack = MyStack.new
        @pop_stack = MyStack.new
    end

    def size
        #alt for in only 
        @push_stack.length
    end

    def empty?
        return true if @push_stack.length == 0 && @pop_stack.length == 0
        return false
        #alt for in ony
        return true if @push_stack.length == 0
        return false
    end

    def enqueue(ele)
        @push_stack.push(ele)
        #@my_queue.push(@my_queue2.pop)
      end

    def dequeue 
        @pop_stack.pop
    end

end

class MinMaxStack
end

class MinMaxStackQueue
end
