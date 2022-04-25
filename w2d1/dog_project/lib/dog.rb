class Dog

def initialize(name, breed, age, bark, favorite_foods)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
end

def name
    @name
end

def breed
    @breed
end

def age
    @age
end

def age= num
    @age = num
end

def bark
    if age > 3 == true
        @bark.upcase
    elsif age <=3 == true
        @bark.downcase
    end
end

def favorite_foods
    @favorite_foods
end

def favorite_food?(foods)
    tempfood = []
    favorite_foods.each do |food|
        if food.downcase.include?(foods.downcase) == true
            return true
        end end
    return false
end

# def favorite_food? (foods)
#     select.favorite_foods {|foods| favorite_foods.include?(foods)}


end

# require "byebug"
#  new1 = Dog.new("Fido", "German Shepard", 3, "Bork!", ["Bacon", "Chicken"])
# p new1.favorite_food?("BACON")