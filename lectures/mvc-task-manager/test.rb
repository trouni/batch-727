require_relative 'repository'
require_relative 'task'
require_relative 'controller'
require_relative 'router'

repo = Repository.new

controller = Controller.new(repo)

router = Router.new(controller)

router.run