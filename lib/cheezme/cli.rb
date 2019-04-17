class Cheezme::CLI
  @@all = []

  def call
    scrape_recipes
    list_recipes
    menu
  end

  def list_recipes
    puts "\n  Allrecipes.com Mac and Cheese recipes:\n\n"
    @@all.each.with_index(1) do |v, i|
      puts "    #{i}. #{v.stars} stars:\t#{v.name}"
    end
    puts
  end

  def menu
    input = ''
    while input != 'exit' do
      puts "Enter the number of the recipe you'd like to see. Type 'list' to see them again, or 'exit' to leave."
      input = gets.downcase.strip

      if input.to_i > 0 and input.to_i <= @@all.size
        recipe = @@all[input.to_i - 1]
        if recipe.ingredients.nil? or recipe.ingredients == []
          recipe.extend_attributes(Cheezme::Scraper.scrape_recipe_page(recipe.url))
        end
        recipe.print_ingredients_and_directions
      elsif input == 'list'
        list_recipes
      elsif input == 'exit'
        goodbye
      else
        puts "Invalid input, try again.\n\n"
      end

    end
  end

  def goodbye
    puts "Thanks your browsing our recipes!"
  end

  def scrape_recipes
    url = 'https://www.allrecipes.com/recipes/509/main-dish/pasta/macaroni-and-cheese/'
    Cheezme::Recipe.create_from_collection(Cheezme::Scraper.scrape_recipe_index(url))
    @@all = Cheezme::Recipe.all
  end

end
