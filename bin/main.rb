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
  @menu.process_main(@user, @students)
  end
end

@input.try_load_students(@students)
print_menu