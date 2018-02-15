require 'csv'

require_relative 'recipe'

class RecipeBook
  def initialize
    @recipes = []
  end

  def load_recipes(filename)
    CSV.foreach(filename, headers: true) do |row|
      p row
    end
  end

  def find_recipe_by_id(recipe_id)
    recipes = []
    @recipes.each do |recipe|
      recipes << recipe if recipe.id == recipe_id
    end

    raise "Can't find a recipe with an id of #{recipe_id.inspect}" unless recipe
    recipes
  end
end