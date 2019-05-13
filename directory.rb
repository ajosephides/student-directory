@students = []
def print_menu
  loop do
  puts "1. Input the students"
  puts "2. Filter the students"
  puts "3. Show the students"
  puts "4. Save the students"
  puts "9. Exit"
  process_choice(gets.chomp)
  end
end

def process_choice(selection)
  case selection
  when "1"
    input_students
  when "2"
    print_filtered(student_filter(filter_choice))
  when "3"
    show_students
  when "4"
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
 return add_students(user_input)
end

def user_input
  user_input = gets.chomp
  if user_input.empty?
    return "Unknown"
  else
    return user_input
  end
end

def add_students(name)
  while name != "Unknown" do
    puts "Please enter their cohort months"
    cohort = user_input
    @students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{@students.count} students\n"
    puts "Please enter the next student's name"
    name = user_input
  end
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

def student_filter(filter_choice)
  case filter_choice
  when "0"
    puts "No filter applied"
  when "1"
    puts "Please enter first letter of students name that you wish to print"
    letter_filter = gets.chomp
    return @students.select { |student| student[:name][0].upcase == letter_filter.upcase}
  when "2"
    puts "Please enter maximum number of characters for a name"
    number_filter = gets.chomp
    return @students.select { |student| student[:name].length <= number_filter.to_i}
  when "3"
    puts "Please choose from the following cohorts #{group_options.join(", ")}"
    cohort_filter = gets.chomp
    return @students.select { |student| student[:cohort].to_s.upcase == cohort_filter.upcase}
  when "9"
    exit
  end
end

def group_options
options = []
@students.each { |student| options << student[:cohort].to_s.capitalize}
return options.uniq
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print
  @students.each_with_index { 
    |student, index | puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  }
end

def print_filtered(filtered_students)
  filtered_students.each_with_index { 
    |student, index | puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  }
end

def print_footer
  puts "Overall, we have #{@students.count} great student#{if @students.count > 1 then "s" end}"
end

def show_students
  print_header
  print
  print_footer
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do | student |
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end



print_menu