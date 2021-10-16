require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def create
    # 1. Ask the view for a name and description
    name = @view.ask_for('name')
    description = @view.ask_for('description')
    # 2. Instantiate a recipe with the name and description
    recipe = Recipe.new(name, description)
    # 3. Add the recipe to the cookbook
    @cookbook.add_recipe(recipe)
  end

  def destroy
    # 1. Display the recipes
    display_recipes
    # 2. Ask user via the view which recipe to delete (=> index)
    recipe_index = @view.ask_for_index
    # 3. Ask the cookbook to remove the recipe
    @cookbook.remove_recipe(recipe_index)
  end

  private

  def display_recipes
    # 1. Get all the recipes from the Cookbook
    recipes = @cookbook.all
    # 2. Ask the view to display the recipes
    @view.display(recipes)
  end
end
