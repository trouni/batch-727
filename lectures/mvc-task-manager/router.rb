class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    loop do
      puts
      puts '-' * 10
      puts
      puts 'Available actions:'
      puts '1. List your tasks'
      puts '2. Add a task'
      puts '3. Mark a task as done'
      puts '0. Exit'
      puts
      puts '-' * 10
      puts
      puts 'What would you like to do?'
      print '> '
      choice = gets.chomp.to_i

      case choice
      when 1 then @controller.list
      when 2 then @controller.create
      when 3 then @controller.mark_task_as_done
      when 0 then break
      else
        puts 'Invalid. Please select one of the options above.'
      end
    end
  end
end