require "byebug"
class Employee
    attr_reader :name, :salary, :title, :boss

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
          if boss != nil
          boss.employees << self
          end
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
    end

   
end

class Manager < Employee
    attr_reader :employees, :salarysum1, :salarysum, :title, :boss, :salary, :name

    def initialize(name, title, salary, boss)
        super
        @employees = []
      end
    #how do we add employees?

    def salarysum
      # @salarysum = @employees.map{|emp| emp.salary }
      @employees.inject(0) do |acc, emp| 
            if emp.is_a?(Manager)
              acc + emp.salary + emp.salarysum
            else
              acc + emp.salary
            end
    end
  end

    def bonus(multiplier)
        bonus = self.salarysum * multiplier
    end

end