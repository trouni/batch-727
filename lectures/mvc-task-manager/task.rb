class Task
  attr_reader :title

  def initialize(title)
    @title = title
    @done = false
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = true
  end
end