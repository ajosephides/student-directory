require_relative '../lib/student.rb'
require_relative '../lib/user.rb'
require_relative '../lib/menu.rb'
require_relative '../lib/students.rb'
require_relative '../lib/output.rb'

@user = User.new
@menu = Menu.new
@students = Students.new

def print_menu
  loop do
  @menu.print_main
  process_choice(@user.menu_selection)
  #@menu.process_main(@user, @students)
  end
end

def process_choice(selection)
  case selection
  when "1"
    #input_students
    @students.add_students
  when "2"
    load_students
  when "3"
    Output.new.print_students(student_filter(filter_choice))
  when "4"
    Output.new.show_students(@students.all_students)
  when "5"
    @students.save_students
  when "9"
    exit
  else
    puts "Please enter one of the choices again"
  end
end

#def input_students
  #puts "Please enter the names of the students"
  #puts "To finish hit return twice when entering a name"
 #return add_students(@user.add_name)
#end
#
#def add_students(name)
  #while name != "Unknown" do
    #puts "Please enter their cohort months"
    #cohort = @user.add_cohort
    #add_student(name, cohort)
    #puts "Now we have #{@students.all_students.count} students\n"
    #puts "Please enter the next student's name"
    #name = @user.add_name
  #end
#end
#
#def add_student(name, cohort)
  #Student.new(name, cohort).add_student(@students.all_students)
#end

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
    puts "Please choose from the following cohorts #{@students.cohorts.join(", ")}"
    @students.cohort_filter(@user.filter_detail)
  when "9"
    exit
  end
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
    @students.add_student(name, cohort)
  end
  file.close
end


try_load_students
print_menu