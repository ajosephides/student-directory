
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit the return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return array of students
  students
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students, filter)
  if filter.empty?
    students.each_with_index do | student, index |
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  else
    students.each_with_index { |student, index| if student[:name][0].upcase == filter then 
      puts("#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)") end }
  end 
end

def student_filter
  puts "Please enter first letter of students name that you wish to print"
  filter = gets.chomp
  return filter.upcase
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#nothing happens until we call the methods
students = input_students
print_header
print(students, student_filter)
print_footer(students)