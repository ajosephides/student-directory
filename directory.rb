
def input_students
  exit = false
  puts "Please enter the names of the students"
  puts "To finish hit return twice when entering a name"
  # create an empty array
  students = []
 return add_students(students, user_input)
  # continue to add names til exit is typed in
  #while !exit do
    #puts "Please enter the student name"
    #name = user_input
    #puts "Please enter their cohort month"
    #cohort = user_input
    #if name.upcase == 'EXIT' || cohort.upcase == 'EXIT'
      #exit = true      
    #else
    ## add the student to the array
    #students << {name: name, cohort: cohort.to_sym}
    #puts "Now we have #{students.count} students"
  #end
#end
  # return array of students
#  return students
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
students = input_students
print_header
print(student_filter(students, filter_choice))
print_footer(students)