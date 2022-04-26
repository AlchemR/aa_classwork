class Bootcamp

  def initialize (name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new{|h,k| h[k] = [] }
  end

  def name
    @name
  end

  def slogan 
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire string
    @teachers.push(string)
  end


  def enroll(student)
    if students.length < @student_capacity
    @students << student
    return true
    elsif @students.length >= @student_capacity
      return false
    end

  end

def enrolled?(student)
  if @students.include?(student)
    return true
  else
    return false
  end
end

def student_to_teacher_ratio
ratio = students.length / teachers.length
return ratio
end

def add_grade (student, grade)
if students.include?(student) == true
  @grades[student] << grade
return true
elsif students.include?(student) == false
  return false
end
end

def num_grades(student)
return @grades[student].length
end

def average_grade(student)
  if students.include?(student) == false
    return nil
  elsif @grades[student].length == 0
      return nil
  elsif students.include?(student) == true
  ratio1 = @grades[student].sum / @grades[student].length
  return ratio1
  end

end


end #last end

