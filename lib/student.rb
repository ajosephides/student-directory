class Student

attr_accessor :name, :cohort

def initialize(name, cohort)
  @name = name
  @cohort = cohort
end

def add_student(students)
  students << self
end

end