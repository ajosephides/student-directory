class Output
  
  def print_header
    puts "The students of Villains Academy"
    puts "-------------"
  end

  def print_students(students)
    students.all_students.each_with_index { 
      |student, index | puts "#{index + 1}. #{student.name} (#{student.cohort} cohort)"
    }
  end
  
  def print_footer(students)
    puts "Overall, we have #{students.all_students.count} great student#{if students.all_students.count > 1 then "s" end}"
  end
  
  def show_students(students)
    print_header
    print_students(students)
    print_footer(students)
  end

  def input_students
    puts "Please enter the names of the students"
    puts "To finish hit return twice when entering a name"
  end


end