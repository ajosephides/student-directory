require 'student'

describe 'Student' do
  let(:student_correct) {
    Student.new('name', 'cohort')
  }

  it 'should raise' do
    expect { Student.new }.to raise_error(ArgumentError)
  end

  it 'should raise' do
    expect { Student.new('name', 'cohort', 'something else') }.to raise_error(ArgumentError)
  end

  it 'should create a Student type object' do
    expect(student_correct).to be_a_kind_of(Student)
  end
end
