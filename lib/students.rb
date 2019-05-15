require_relative './student.rb'
require_relative './user.rb'
require_relative './menu.rb'
require_relative './output.rb'

class Students

attr_accessor :all_students

def initialize
  @all_students = []
end

def first_letter_filter(letter)
  filtered_students = Students.new
  self.all_students.each { |student| if student.name[0].upcase == letter.upcase 
    then filtered_students.add_student(Student.new(student.name, student.cohort)) end 
  }
  return filtered_students
end

def character_filter(number)
  filtered_students = Students.new
  self.all_students.each { |student| if student.name.length <= number.to_i
    then filtered_students.add_student(Student.new(student.name, student.cohort)) end 
  }
  return filtered_students
end

def cohort_filter(cohort)
  filtered_students = Students.new
  self.all_students.each { |student| if student.cohort.upcase == cohort.upcase
    then filtered_students.add_student(Student.new(student.name, student.cohort)) end 
  }
  return filtered_students
end

def cohorts
  options = []
  self.all_students.each { |student| options << student.cohort.to_s.capitalize}
  return options.uniq
end

def save_students
  file = File.open("students.csv", "w")
  self.all_students.each do | student |
    student_data = [student.name, student.cohort]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def add_students
  output = Output.new
  input = User.new
  output.input_students
  name = input.add_name
  while name != "Unknown" do
    puts "Please enter their cohort months"
    cohort = input.add_cohort
    add_student(Student.new(name, cohort))
    output.success_student_added(self)
    name = input.add_name
  end
end

def add_student(student)
  self.all_students << student
end

def number
  self.all_students.count
end

end