class Input

  def try_load_students(students)
    filename = ARGV.first
    return if filename.nil?
    if File.exists?(filename)
      self.load_students(students, filename)
      puts "Loaded #{students.all_students.count} from #{filename}"
    else
      puts "Sorry, #{filename} doesn't exist"
      exit
    end
  end
  
  def load_students(students, filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do | line |
      name, cohort = line.chomp.split(',')
      students.add_student(name, cohort)
    end
    file.close
  end


end