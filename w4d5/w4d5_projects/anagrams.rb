# PHASE 1 

def first_anagram?(str1, str2)
    letters = str1.split("")
    combo = letters.permutation.to_a
    combo.map! {|ele| ele.join("")}
    combo.include?(str2)
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

# PHASE 2

def second_anagram?(str1, str2)
  str_2 = str2.split("")
  str1.each_char do |letter|
    idx = str_2.index(letter)
    next if idx == nil
    str_2.delete_at(idx)
  end
  str_2.empty?
end


# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

#phase III
def third_anagram?(str_1, str_2)
str1 = str_1.split("").sort
str2 = str_2.split("").sort
return true if str1 == str2 
return false
end


# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true


#phase IV
def fourth_anagram?(str_1, str_2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str_1.each_char {|letter| hash1[letter] += 1}
  str_2.each_char {|letter| hash2[letter] += 1}
  return true if hash1 == hash2
  return false if hash1 != hash2
end


# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true


# # p third_anagram?("gizmo", "sally")    #=> false
# # p third_anagram?("elvis", "lives")    #=> true


def bonus_anagram?(str_1, str_2)
  hash1 = Hash.new(0)
  str_1.each_char {|letter| hash1[letter] += 1}
  str_2.each_char {|letter| hash1[letter] -= 1}
  hash1.each_value do |val|
    if val != 0
      return false
    end
  end
  return true
end

p bonus_anagram?("gizmo", "sally")    #=> false
p bonus_anagram?("elvis", "lives")    #=> true
