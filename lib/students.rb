class Students

attr_accessor :all_students

def initialize
  @all_students = []
end

def first_letter_filter(letter)
  return self.all_students.select { |student| student.name[0].upcase == letter.upcase}
end

def character_filter(number)
  return self.all_students.select { |student| student.name.length <= number.to_i}
end

def cohort_filter(cohort)
  return self.all_students.select { |student| student.cohort.upcase == cohort.upcase}
end

end