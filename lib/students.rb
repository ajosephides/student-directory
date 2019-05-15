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
  return self.all_students.select { |student| student.name[0].upcase == letter.upcase}
end

def character_filter(number)
  return self.all_students.select { |student| student.name.length <= number.to_i}
end

def cohort_filter(cohort)
  return self.all_students.select { |student| student.cohort.upcase == cohort.upcase}
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
  output = Output.new.input_students
  input = User.new
  name = input.add_name
  while name != "Unknown" do
    puts "Please enter their cohort months"
    cohort = input.add_cohort
    add_student(name, cohort)
    puts "Now we have #{self.all_students.count} students\n"
    puts "Please enter the next student's name"
    name = input.add_name
  end
end

def add_student(name, cohort)
  Student.new(name, cohort).add_student(self.all_students)
end




end