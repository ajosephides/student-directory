class Output
  def print_header
    puts 'The students of Villains Academy'
    puts '-------------'
  end

  def print_students(students)
    students.all_students.each_with_index { |student, index|
      puts "#{index + 1}. #{student.name} (#{student.cohort} cohort)"
    }
  end

  def print_footer(students)
    puts "Overall, we have #{students.number} great student#{if students.number > 1 then "s" end}"
  end

  def show_students(students)
    print_header
    print_students(students)
    print_footer(students)
  end

  def input_students
    puts 'Please enter the names of the students'
    puts 'To finish hit return twice when entering a name'
  end

  def success_student_added(students)
    puts "Now we have #{students.number} students\n"
    puts "Please enter the next student's name"
  end

  def load_file
    puts 'What file would you like to load'
  end

  def save_file
    puts 'What would you like to save the file as'
  end

  def success_load
    puts 'Succesfully loaded file'
  end

  def success_save
    puts 'Succesfully saved file'
  end
end
