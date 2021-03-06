require 'csv'

require_relative 'recipe'

class RecipeBook
  attr_reader :recipe_list

  def initialize
    @recipe_list = []
  end

  def load_recipes(filename)
    CSV.foreach(filename, headers: true) do |row|
      recipe_list << Recipe.new(id: row[0],
                                name: row[1],
                                description: row[2],
                                ingredients: row[3],
                                directions: row[4])
    end
  end

  def find_recipe_by_id(recipe_id)
    found_recipe = []
    recipe_list.each do |recipe|
      found_recipe << recipe if recipe.id == recipe_id
    end

    raise "Can't find a recipe with an id of #{recipe_id.inspect}" unless !found_recipe.empty?
    found_recipe
  end
end