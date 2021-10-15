require_relative 'view'
require_relative 'task'

class Controller
  def initialize(repository)
    @repo = repository
    @view = View.new
  end

  def list
    display_tasks
  end

  def create
    # 1. Tell the view to ask the title of the task to the user
    title = @view.ask_for_title
    # 2. Instantiate a task
    task = Task.new(title)
    # 3. Store the task in the repository
    @repo.add(task)
  end

  def mark_task_as_done
    # 1. View: Display the tasks
    display_tasks
    # 2. View: Ask user for which task to mark as done (index)
    index = @view.ask_for_index
    # 3. Get the task from the repository
    task = @repo.find(index)
    # 4. Mark the task as done
    task.mark_as_done!
  end

  private

  def display_tasks
    # 1. Get the list of tasks from the repository
    tasks = @repo.all
    # 2. Ask the view to display the tasks
    @view.display(tasks)
  end
end