require_relative './student.rb'
require_relative './user.rb'
require_relative './menu.rb'
require_relative './students.rb'
require_relative './output.rb'

@user = User.new
@menu = Menu.new
@students = Students.new

def print_menu
  loop do
  @menu.print_main
  process_choice(@user.menu_selection)
  end
end

def process_choice(selection)
  case selection
  when "1"
    input_students
  when "2"
    load_students
  when "3"
    Output.new.print_students(student_filter(filter_choice))
  when "4"
    #show_students
    Output.new.show_students(@students.all_students)
  when "5"
    save_students
  when "9"
    exit
  else
    puts "Please enter one of the choices again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish hit return twice when entering a name"
 return add_students(@user.add_name)
end

def add_students(name)
  while name != "Unknown" do
    puts "Please enter their cohort months"
    cohort = @user.add_cohort
    add_student(name, cohort)
    puts "Now we have #{@students.all_students.count} students\n"
    puts "Please enter the next student's name"
    name = @user.add_name
  end
end

def add_student(name, cohort)
  Student.new(name, cohort).add_student(@students.all_students)
end

def filter_choice
@menu.print_filter
return @user.filter_selection
end

def student_filter(filter_choice)
  case filter_choice
  when "0"
    puts "No filter applied"
  when "1"
    puts "Please enter first letter of students name that you wish to print"
    @students.first_letter_filter(@user.filter_detail)
  when "2"
    puts "Please enter maximum number of characters for a name"
    @students.character_filter(@user.filter_detail)
  when "3"
    puts "Please choose from the following cohorts #{group_options.join(", ")}"
    @students.cohort_filter(@user.filter_detail)
  when "9"
    exit
  end
end

def group_options
options = []
@students.all_students.each { |student| options << student.cohort.to_s.capitalize}
return options.uniq
end

def save_students
  file = File.open("students.csv", "w")
  @students.all_students.each do | student |
    student_data = [student.name, student.cohort]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.all_students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do | line |
    name, cohort = line.chomp.split(',')
    add_student(name, cohort)
  end
  file.close
end

