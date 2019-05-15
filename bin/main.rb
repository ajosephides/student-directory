require_relative '../lib/student.rb'
require_relative '../lib/user.rb'
require_relative '../lib/menu.rb'
require_relative '../lib/students.rb'
require_relative '../lib/output.rb'
require_relative '../lib/input.rb'

@user = User.new
@menu = Menu.new
@students = Students.new
@input = Input.new

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
    @students.add_students
  when "2"
    @input.load_students(@students)
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

@input.try_load_students(@students)
print_menu