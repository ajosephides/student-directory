
def interactive_menu
  students = []
  loop do
  puts "1. Input the students"
  puts "2. Filter the students"
  puts "3. Show the students"
  puts "9. Exit"
  selection = gets.chomp
  case selection
  when "1"
    students = input_students
  when "2"
    students = student_filter(students, filter_choice)
  when "3"
    print_header
    print(students)
    print_footer(students)
  when "9"
    exit
  else
    puts "Please enter one of the choices again"
  end
end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish hit return twice when entering a name"
  students = []
 return add_students(students, user_input)
end

def user_input
  user_input = gets.chomp
  if user_input.empty?
    return "Unknown"
  else
    return user_input
  end
end

def add_students(students, name)
  while name != "Unknown" do
    puts "Please enter their cohort months"
    cohort = user_input
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students\n"
    puts "Please enter the next student's name"
    name = user_input
  end
  return students
end

def filter_choice
puts "Please select an option to filter by"
puts "0. No filter"
puts "1. Filter by first letter of name"
puts "2. Filter by number of characters in name"
puts "3. Filter by cohort"
puts "9. Exit"
return gets.chomp
end

def student_filter(students, filter_choice)
  case filter_choice
  when "0"
    return students
  when "1"
    puts "Please enter first letter of students name that you wish to print"
    letter_filter = gets.chomp
    return students.select { |student| student[:name][0].upcase == letter_filter.upcase}
  when "2"
    puts "Please enter maximum number of characters for a name"
    number_filter = gets.chomp
    return students.select { |student| student[:name].length <= number_filter.to_i}
  when "3"
    puts "Please choose from the following cohorts #{group_options(students).join(", ")}"
    cohort_filter = gets.chomp
    return students.select { |student| student[:cohort].to_s.upcase == cohort_filter.upcase}
  when "9"
    exit
  end
end

def group_options(students)
options = []
students.each { |student| options << student[:cohort].to_s.capitalize}
return options.uniq
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index { 
    |student, index | puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great student#{if names.count > 1 then "s" end}"
end

#nothing happens until we call the methods
#students = input_students
#print_header
#print(student_filter(students, filter_choice))
#print_footer(students)
interactive_menu