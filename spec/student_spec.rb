require 'student'

describe 'Student' do

  it "should raise" do
    expect{Student.new}.to raise_error(ArgumentError)
  end

  it "should raise" do
    expect{Student.new("name", "cohort", "something else")}.to raise_error(ArgumentError)
  end 

end