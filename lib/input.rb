require 'csv'
require_relative './student.rb'

class Input

  def try_load_students(students)
    filename = ARGV.first
    if filename.nil?
      self.load_students(students, 'students.csv')
      puts "Loaded #{students.number} from students.csv"
    elsif File.exists?(filename)
      self.load_students(students, filename)
      puts "Loaded #{students.number} from #{filename}"
    else
      puts "Sorry, #{filename} doesn't exist"
      exit
    end
  end
  
  def load_students(students, filename = "students.csv")
    CSV.foreach(filename) do |row|
      name, cohort = row
      students.add_student(Student.new(name, cohort))
    end
    Output.new.success_load
  end

end