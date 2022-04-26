# Monkey-Patch Ruby's existing Array class to add your own custom methods
require "byebug"
class Array
    
  def span
    if self.length == 0 
        return nil
 end
return self.max - self.min 
end

def average
    if self.length < 1 
        return nil
    end
    return self.sum.to_f / self.length.to_f
end

def median
newarr = self.sort
if self.length == 0
return nil
elsif self.length % 2 == 0 
split = self.length / 2
return ( (newarr[split].to_f + newarr[split-1].to_f) / 2 )
elsif self.length % 2 != 0 
mid = (self.length - 1) / 2
return newarr[mid]
end
end

def counts
    hashy = Hash.new{0}
self.each do |ele|
hashy[ele] += 1
end
return hashy
end

def my_count(str)
neww = self.counts
return neww[str]
end

def my_index(str)
    
self.each_with_index do |ele, idx|
    if ele == str
        return idx
    end
end
        return nil
end


def my_uniq
    output = []
    self.each do |ele|
        if output.include?(ele) == false
            output << ele
        end
    end
    return output
end

def my_transpose
    output = []
    output1 = []
    self.each_with_index do |ele1, idx1|
        ele1.each_with_index do |ele2, idx2|
        output << self[idx2][idx1]
        end
        output1 << output
        output = []
    end
return output1
end

end #last end

  arr_1 = [
          ["a", "b", "c"],
          ["d", "e", "f"],
          ["g", "h", "i"]
        ]
        arr_1.my_transpose