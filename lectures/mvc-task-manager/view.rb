class View
  def display(tasks)
    puts '=' * 50
    puts 'These are your tasks:'
    tasks.each_with_index do |task, index|
      x = task.done? ? 'x' : ' '
      puts "#{index + 1} - [#{x}] #{task.title}"
    end
    puts '=' * 50
  end

  def ask_for_title
    puts "What's your task?"
    print '> '
    gets.chomp
  end

  def ask_for_index
    puts "Which task?"
    print '> '
    gets.chomp.to_i - 1
  end
end