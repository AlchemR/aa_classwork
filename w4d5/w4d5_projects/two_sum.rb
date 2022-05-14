# BRUTE FORCE

def bad_two_sum?(arr, target)
    arr.each_with_index do |ele1, idx1|
        arr.each_with_index do |ele2, idx2|
            if idx2 > idx1
                return true if ele1 + ele2 == target
            end
        end
    end
    return false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

# o(n) + o(log n)
def okay_two_sum?(arr, target)
    sorted_arr = arr.sort
    sorted_arr.each_with_index do |ele, idx|
      temp = target - ele
      return true if okay_bsearch(arr[idx..-1], temp)
    end
    return false
end

def okay_bsearch(arr,target)
    return false if arr.length == 0

    mid = arr.length/2
    return true if arr[mid] == target
    left = arr[0...mid]
    right = arr[mid + 1..-1]
    if arr[mid] > target
        okay_two_sum?(left, target)
    else
        okay_two_sum?(right, target)
    end
end

# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def two_sum?(arr, target)
    hash1 = {}
    arr.each do |ele|
      return true if hash1[ele]
      temp = target - ele
      hash1[temp] = true
    end
    return false
end

# arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false