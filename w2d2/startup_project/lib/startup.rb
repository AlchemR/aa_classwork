require "employee"
require "byebug"
class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, hashsal)
        @name = name
        @funding = funding
        @salaries = Hash.new
        hashsal.each do |k,v|
            @salaries[k] = v
        end
        @employees = []
    end

    def valid_title?(title)
    @salaries.has_key?(title)
    end

def >(startup_2)
    if @funding > startup_2.funding
        return true
    else
        return false
    end
end

def hire(name, title)
if valid_title?(title)
   @employees << Employee.new(name, title)
else
    raise_error
end
end

def size
    return @employees.length
end

def pay_employee(employeeinst)
salnum = @salaries[employeeinst.title]
    if salnum.to_i < @funding
    employeeinst.pay(salnum.to_i)
    @funding -= salnum.to_i
    else
        raise_error
    end
end

def payday
    @employees.each do |emp|
        pay_employee(emp)
    end
end

def average_salary
   empnum = @employees.length
   total = 0
   @employees.each do |emp|
   total += @salaries[emp.title] 
   end
   return (total / empnum)
end

def close
    @employees = []
    @funding = 0
end

def acquire(startup2)
    @funding += startup2.funding
    startup2.salaries.each do |k,v|
        if @salaries.has_key?(k)
        else            
        @salaries[k] = v
        end
    end
@employees += startup2.employees
startup2.close()
end



end#lastend
