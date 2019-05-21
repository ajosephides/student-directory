class User
  def input
    user_input = STDIN.gets.chomp
    if user_input.empty?
      return "Unknown"
    else
      return user_input
    end
  end

  def menu_selection
    return input
  end

  def filter_selection
    return input
  end

  def filter_detail
    return input
  end

  def add_name
    return input
  end

  def add_cohort
    return input
  end

  def load_file
    return input
  end

  def save_file
    return input
  end
end
