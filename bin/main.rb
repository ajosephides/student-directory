require_relative '../lib/menu.rb'
require_relative '../lib/students.rb'
require_relative '../lib/input.rb'

menu = Menu.new
students = Students.new
input = Input.new

input.try_load_students(students)
loop do
  menu.print_main
  menu.process_main(students)
end