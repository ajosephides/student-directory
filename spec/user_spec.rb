require 'user'

describe 'User' do
  before(:all) do
    @user = User.new
  end

    context "user enters a menu choice" do
      let (:user_input) { "1\n" }
      it "returns the user menu choice" do
        allow(STDIN).to receive(:gets) {user_input}
        expect(@user.menu_selection).to eq("1")
      end
    end

    context "user enters a filename" do
      let (:user_filename) { "students.csv\n" }
      it "returns the user input filename" do
        allow(STDIN).to receive(:gets) {user_filename}
        expect(@user.save_file).to eq("students.csv")
      end
    end

    context "user enters a blank cohort entry" do
      let (:user_cohort) { "\n" }
      it "returns the user input filename" do
        allow(STDIN).to receive(:gets) {user_cohort}
        expect(@user.add_cohort).to eq("Unknown")
      end
    end


end