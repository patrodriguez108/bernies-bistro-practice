require 'csv'

require_relative 'recipe'

class RecipeBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def load_recipes(filename)
    CSV.foreach(filename, headers: true) do |row|
      recipes << Recipe.new(id: row[0],
                            name: row[1],
                            description: row[2],
                            ingredients: row[3],
                            directions: row[4])
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