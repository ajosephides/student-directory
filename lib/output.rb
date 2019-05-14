class Output
  
  
  def print_header
    puts "The students of Villains Academy"
    puts "-------------"
  end

  def print_students(students)
    students.each_with_index { 
      |student, index | puts "#{index + 1}. #{student.name} (#{student.cohort} cohort)"
    }
  end
  
  def print_footer(students)
    puts "Overall, we have #{students.count} great student#{if students.count > 1 then "s" end}"
  end
  
  def show_students(students)
    print_header
    print_students(students)
    print_footer(students)
  end

end