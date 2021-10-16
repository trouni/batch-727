require 'csv'

class Cookbook
  def initialize(csv_file_path)
    @recipes = [] # array of instances of Recipe
    @csv_file_path = csv_file_path
    load_csv
  end

  def all
    @recipes
  end

  # recipe is an instance of Recipe
  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      # We need to push instances of Recipe inside of @recipes
      name = row[0]
      description = row[1]
      recipe = Recipe.new(name, description)
      @recipes << recipe
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
