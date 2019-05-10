
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
  if filter[:letter_filter].empty? && filter[:number_filter].empty?
    students.each_with_index { 
      |student, index | puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    }
  elsif !filter[:letter_filter].empty? && filter[:number_filter].empty?
    students.each_with_index { 
      |student, index| if student[:name][0].upcase == filter[:letter_filter].upcase then 
      puts("#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)") 
    end 
    }
  elsif filter[:letter_filter].empty? && !filter[:number_filter].empty?
    students.each_with_index {
      |student, index| if student[:name].length <= filter[:number_filter].to_i then 
        puts("#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)") 
      end 
    }
    elsif !filter[:letter_filter].empty? && !filter[:number_filter].empty?
    students.each_with_index {
        |student, index| if (student[:name][0].upcase == filter[:letter_filter].upcase && 
          student[:name].length <= filter[:number_filter].to_i) then
          puts("#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)") 
        end 
    }
  end 
end

def student_filter
  filter = {}
  puts "Please enter first letter of students name that you wish to print"
  letter_filter = gets.chomp
  filter[:letter_filter] = letter_filter
  puts "Please enter maximum number of characters for a name"
  number_filter = gets.chomp
  filter[:number_filter] = number_filter
  return filter
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#nothing happens until we call the methods
students = input_students
print_header
print(students, student_filter)
print_footer(students)