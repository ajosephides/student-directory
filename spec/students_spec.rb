require 'output'
require 'students'
require 'student'

describe 'Students' do

  let(:students) {
    Students.new
  }

  let(:adding_students){
    students = Students.new
    student1 = Student.new("name","cohort")
    student2 = Student.new("name","cohort")
    students.add_student(student1)
    students.add_student(student2)
    students.number
  }

  it 'creates a new empty students array' do
    expect(Students.new.all_students.count).to eq(0) 
  end
  
  it 'can create a students' do
    expect(students).to be_a_kind_of(Students)
  end

  it 'should have added 2 students' do
    expect(adding_students).to eq(2)
  end

  
end