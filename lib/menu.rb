require_relative './input.rb'
require_relative './output.rb'

class Menu
  def print_main
    puts "\n--------------------------------"
    puts "1. Input the students manually"
    puts "2. Load students from a file"
    puts "3. Filter the students"
    puts "4. Show all the students"
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

  def process_main(students)
    user = User.new
    selection = user.menu_selection
    case selection
    when "1"
      students.add_students
    when "2"
      Output.new.load_file
      Input.new.load_students(students, user.load_file)
    when "3"
      self.print_filter
      Output.new.print_students(student_filter(students))
    when "4"
      Output.new.show_students(students)
    when "5"
      Output.new.save_file
      students.save_students(user.save_file)
    when "9"
      exit
    else
      puts "Please enter one of the choices again"
    end
  end

  def student_filter(students)
    user = User.new
    filter_choice = user.filter_selection
    case filter_choice
    when "0"
      puts "No filter applied"
    when "1"
      puts "Please enter first letter of students name that you wish to print"
      students.first_letter_filter(user.filter_detail)
    when "2"
      puts "Please enter maximum number of characters for a name"
      students.character_filter(user.filter_detail)
    when "3"
      puts "Please choose from the following cohorts #{students.cohorts.join(", ")}"
      students.cohort_filter(user.filter_detail)
    when "9"
      exit
    end
  end
end
