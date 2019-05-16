require 'output'

describe 'print_header' do
  before(:all) do
    @output = Output.new
  end
  
  it 'prints header' do
    expect{ @output.print_header }.to output("The students of Villains Academy\n-------------\n").to_stdout
  end
end