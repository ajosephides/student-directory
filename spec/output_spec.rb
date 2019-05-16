require 'output'
require 'students'
require 'student'

describe 'Output' do
  before(:all) do
    student1 = Student.new("student1", "november")
    student2 = Student.new("student2", "november")
    @students = Students.new
    @students.add_student(student1)
    @students.add_student(student2)
    @output = Output.new
  end
  
  it 'prints header' do
    expect{ @output.print_header }.to output("The students of Villains Academy\n-------------\n").to_stdout
  end

  it 'will output student count when 2 students are in @students' do
    expect { @output.print_footer(@students) }.to output("Overall, we have 2 great students\n").to_stdout
  end

end