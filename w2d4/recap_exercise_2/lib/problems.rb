require "byebug"
# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
arr1 = [num_1, num_2].sort
arr2 = []
    (1..arr1.max).each do |ele|
    arr2 << ele * num_1 # num 1 multiples between it and high numbers
    end

(1..arr1.max).each do |ele|
   temp = ele * num_2 # num 2 multiples 
   if arr2.include?(temp)
    return temp
    end
end


end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
hashy = Hash.new(1)
    str.each_char.with_index do |letter, idx|
        if idx != str.length-1
        temp2 = idx+1
        temp = letter + str[temp2]
            if hashy.has_key?(temp)
            hashy[temp] += 1
            else 
                hashy[temp] = 1
            end
        end
    end
max = hashy.values.max
return hashy.key(max)

end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        hashy = {}
        self.each do |k,v|
        hashy[v] = k 
        
        end
        return hashy

    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        self.each_with_index do |ele1, idx1|
        self.each_with_index do |ele2, idx2|
            if idx2 > idx1 &&
                if ele1 + ele2 == num
                    count += 1
                end
            end

        end
        end
        return count
    end



    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
prc || prc =Proc.new {|a, b| a <=> b}
# sorted = false
# while sorted == false
#     sorted = true
#         self.each_with_index do |ele, idx|
#         if self[idx+1] > self[idx]
#         end
sorted = false
while sorted == false
    sorted = true
    self.each_with_index do |ele, idx| 
        temp = self[idx+1]
        if prc.call(ele, temp) == -1  # a less than b = -1
        #do nothing
        elsif prc.call(ele, temp) == 0 #a equals b
            #nothing
        elsif prc.call(ele, temp) == 1 #a is greater than b
            self[idx+1] = self[idx]
            self[idx] = temp
            sorted = false
        end
    end
end
return self
    end

end
