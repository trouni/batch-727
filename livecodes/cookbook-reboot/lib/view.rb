class View
  def display(recipes)
    puts '=' * 40
    puts 'Here are your recipes:'
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} | #{recipe.name} - #{recipe.description}"
    end
    puts '=' * 40
  end

  def ask_for(something)
    puts "What is the #{something} of your recipe?"
    print '> '
    gets.chomp
  end

  def ask_for_index
    puts "Which recipe?"
    print '> '
    gets.chomp.to_i - 1
  end
end
