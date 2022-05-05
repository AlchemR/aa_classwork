#warmup
require "byebug"
def range(num1, num2)
    output = []
    (num1...num2).each do |ele|
        output << ele
    end
    output
end

def recrange(num1, num2)
    return [] if num1 == num2
    recrange(num1, num2 - 1) << num2 - 1
end

def recexp(b, e)
    return 1 if e == 0
    b * recexp(b, e - 1)
end

def recexp_2(b,e)
  return 1 if e == 0
  return b if e == 1
  if e % 2 == 0
    recexp_2(b , e / 2) ** 2 #even
  elsif e % 2 != 0 
    b * (recexp(b, (e - 1) / 2) ** 2)
  end
end



# p recexp_2(2, 7)
class Array
    #new object ID's, copy exactly, do not merge arrays; if change one array, does not change the others (don't do array.new(3) )
    def deep_doop
      #if not array, do each
      #if array, go in one level
        self.map do |ele|
            if ele.is_a?(Array) == true
                ele.deep_doop
            else
                ele
            end
        end
    end
end
# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# arr = [1, [2], [3, [4]]]
# test = arr.deep_doop
# test[1][0] = 9
# p test
# p arr

def rec_fib(n)
    return [] if n < 1
    return [1] if n == 1
    return [1, 1] if n == 2
    prev = rec_fib(n - 1)
    prev << prev[-2] + prev[-1]
end
# p rec_fib(10)

def iter_fib(n)
    fib = [1,1]
    return [] if n < 1
    return [1] if n == 1
    return [1, 1] if n == 2 

    while n > fib.length
        fib << (fib[-1] + fib[-2])
    end

  return fib
end
# p iter_fib(10)

def bsearch(arr, tar)
    return nil if arr.length == 0
    mid = arr.length / 2
    return mid if arr[mid] == tar
    left = arr[0...mid]
    right = arr[mid+1..-1]
    if arr[mid] < tar 
        stack = bsearch(right, tar)
        if stack != nil
            return stack + left.length + 1
        else
            return nil
        end
    elsif arr[mid] > tar 
        bsearch(left, tar)
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
    return arr if arr.length == 1
    return arr if arr.length == 0
    mid = arr.length / 2
    merge(merge_sort(arr[0...mid]),merge_sort(arr[mid..-1]))
    # left = merge_sort(arr[0...mid])
    # right = merge_sort(arr[mid..-1])
    # merge(left,right)
end


def merge(left, right)
output = []
max = (left.length + right.length)
    while output.length < max
        leftsmall = left.min 
        leftidx = left.index(leftsmall)
        rightsmall = right.min
        rightidx = right.index(rightsmall)
        if left.length == 0
            output << rightsmall
            right.delete_at(rightidx)
        elsif right.length == 0
            output << leftsmall
            left.delete_at(leftidx)
        elsif leftsmall > rightsmall
            output << rightsmall
            right.delete_at(rightidx)
        elsif rightsmall > leftsmall
            output << leftsmall
            left.delete_at(leftidx)
        elsif leftsmall == rightsmall    
            output << leftsmall
            left.delete_at(leftidx)
        end
    end
return output    
end


# p merge_sort([1,9,2,8,3,6,7,3])

# #close but does not work

# def merge(ele1, ele2)
# bubble = false
# while bubble = false
#     bubble = true
# end
# #works, but why go recursive

def array_subsets(arr)
    return arr if !arr.is_a?(Array)
    # i = 0
    # while i < arr.length
    #     temp = []
    #     arr.each do |e|
    #         temp << e
    #     end
    #     result += temp
    #     i += 1
    # end
    arr.each do |ele|
      array_subsets(arr[1..-1])
    end
    # # array_subsets(arr.length) 
    # somearr << array_subsets(arr.pop)
end

p array_subsets([1,2,3])