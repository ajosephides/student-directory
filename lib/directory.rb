@students = []
def print_menu
  loop do
  puts "\n--------------------------------"
  puts "1. Input the students manually"
  puts "2. Load students from a file"
  puts "3. Filter the students"
  puts "4. Show the students"
  puts "5. Save the students"
  puts "9. Exit"
  puts "--------------------------------\n"
  process_choice(STDIN.gets.chomp)
  end
end

def process_choice(selection)
  case selection
  when "1"
    input_students
  when "2"
    load_students
  when "3"
    print_filtered(student_filter(filter_choice))
  when "4"
    show_students
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
 return add_students(user_input)
end

def user_input
  user_input = STDIN.gets.chomp
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
    add_student(name, cohort)
    puts "Now we have #{@students.count} students\n"
    puts "Please enter the next student's name"
    name = user_input
  end
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def filter_choice
puts "Please select an option to filter by"
puts "0. No filter"
puts "1. Filter by first letter of name"
puts "2. Filter by number of characters in name"
puts "3. Filter by cohort"
puts "9. Exit"
return STDIN.gets.chomp
end

def student_filter(filter_choice)
  case filter_choice
  when "0"
    puts "No filter applied"
  when "1"
    puts "Please enter first letter of students name that you wish to print"
    letter_filter = STDIN.gets.chomp
    return @students.select { |student| student[:name][0].upcase == letter_filter.upcase}
  when "2"
    puts "Please enter maximum number of characters for a name"
    number_filter = STDIN.gets.chomp
    return @students.select { |student| student[:name].length <= number_filter.to_i}
  when "3"
    puts "Please choose from the following cohorts #{group_options.join(", ")}"
    cohort_filter = STDIN.gets.chomp
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

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
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
