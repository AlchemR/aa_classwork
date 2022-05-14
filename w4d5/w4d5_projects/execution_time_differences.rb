# PHASE 1 

def my_min(list)
    min = 0 
    list.each_with_index do |ele1, idx1|
      list.each_with_index do |ele2, idx2|
        if idx1 < idx2
          if ele1 > ele2 && ele2 < min
            min = ele2
            break
          end
        end
      end
    end
    min
end

# PHASE 2

def my_min2(list)
    min = 10000000
    list.each do |ele|
        if ele < min
            min = ele
        end
    end
    return min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min2(list)

# PHASE 1

def largest_contiguous_subsum(list)
    sub_arrs = []
    (0...list.length).each do |i|
        (0...list.length).each do |j|
            sub_arrs << list[i..j] if i <= j
        end
    end
    max_sum = -1000
    sub_arrs.each do |ele|
        max_sum = ele.sum if ele.sum > max_sum
    end
    return max_sum
end

def largest_contiguous_subsum2(list)
    largest_sum = list[0]
    current_sum = list[0]
    list[1..-1].each do |ele|
        current_sum += ele
        if current_sum > largest_sum
          largest_sum = current_sum
        elsif current_sum < 0
            current_sum = 0 
        end
    end
    return largest_sum
end


list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum2(list)

