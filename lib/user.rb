class User
  def input
    user_input = STDIN.gets.chomp
    if user_input.empty?
      return 'Unknown'
    else
      return user_input
    end
  end

  def menu_selection
    input
  end

  def filter_selection
    input
  end

  def filter_detail
    input
  end

  def add_name
    input
  end

  def add_cohort
    input
  end

  def load_file
    input
  end

  def save_file
    input
  end
end
