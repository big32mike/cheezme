class Cheezme::CLI
  @@all = []

  def call
    scrape_recipes
    list_recipes
    menu
    goodbye
  end

  def list_recipes
    puts "Choose from the list of recipes:"
    @@all.each.with_index(1) do |v, i|
      puts "#{i}. #{v.stars} stars:\t#{v.name}"
    end
    puts "\n"
  end

  def menu
    input = ''
    while input != 'exit' do
      puts "Enter the number of the recipe you'd like to see."
      puts "Type 'list' to see them again, or 'exit' to leave."
      input = gets.downcase.strip
      if input.to_i > 0 and input.to_i <= @@all.size
        recipe = @@all[input.to_i - 1]
        if recipe.ingredients.nil?
          recipe.extend_attributes(Cheezme::Scraper.scrape_recipe_page(recipe.url))
        end
        puts "\nYou've chosen #{recipe.name}.\n#{recipe.description}\n"
        puts "#{recipe.stars} stars\t#{recipe.reviews} reviews."

        recipe.print_ingredients_and_directions
      elsif input == 'list'
        list_recipes
      else
        puts 'Invalid input'
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
