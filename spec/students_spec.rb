require 'output'
require 'students'
require 'student'

describe 'Students' do

  let(:students) {
    Students.new
  }

  it 'creates a new empty students array' do
    expect(Students.new.all_students.count).to eq(0) 
  end
  
  it 'can create a students' do
    expect(students).to be_a_kind_of(Students)
  end

  
end