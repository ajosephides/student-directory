

class Menu

def print_main
  puts "\n--------------------------------"
  puts "1. Input the students manually"
  puts "2. Load students from a file"
  puts "3. Filter the students"
  puts "4. Show the students"
  puts "5. Save the students"
  puts "9. Exit"
  puts "--------------------------------\n"
end

def print_filter
  puts "Please select an option to filter by"
  puts "0. No filter"
  puts "1. Filter by first letter of name"
  puts "2. Filter by number of characters in name"
  puts "3. Filter by cohort"
  puts "9. Exit"
end

#def process_main(selection)
  #case selection
  #when "1"
    #input_students
  #when "2"
    #load_students
  #when "3"
    #Output.new.print_students(student_filter(filter_choice))
  #when "4"
    #Output.new.show_students(@students.all_students)
  #when "5"
    #@students.save_students
  #when "9"
    #exit
  #else
    #puts "Please enter one of the choices again"
  #end
#end



end