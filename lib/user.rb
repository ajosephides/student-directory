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

  def add_name
    return input
  end

  def add_cohort
    return input
  end

end