require_relative 'recipe'
require_relative 'recipe_book'


if ARGV.any?

  # I wonder if I could clean this up...
  recipe_book = RecipeBook.new
  recipe_book.load_recipes("recipes.csv")

  if ARGV[0] == "list"
    recipe_book.recipe_list.each do |list|
    	puts "#{list.id} - #{list.name}"
    end
  elsif ARGV[0] == "display"
    displayed_recipe = recipe_book.find_recipe_by_id(ARGV[1])[0]
    puts "Recipe #{displayed_recipe.id} - #{displayed_recipe.name}"
    puts "#{displayed_recipe.description}"
    puts ""
    puts "Ingredients:"
    puts "#{displayed_recipe.ingredients}"
    puts ""
    puts "Preparation Instructions:"
    puts "#{displayed_recipe.directions}"
  end
end
