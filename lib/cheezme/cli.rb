class Cheezme::CLI
  @@all = []
  @@url = 'https://www.allrecipes.com/recipes/509/main-dish/pasta/macaroni-and-cheese/'


  def call
    scrape_recipes
    list_recipes
    menu
  end

  def list_recipes
    puts Rainbow("\n  Allrecipes.com Mac and Cheese recipes:\n\n").bright.lemonchiffon
    @@all.each.with_index(1) do |v, i|
      puts Rainbow("    #{i}. ").lightblue + \
      Rainbow("#{v.stars} stars:").send("#{v.color}") \
      + Rainbow("\t#{v.name}").lightblue
    end
    puts
  end

  def menu
    input = ''
    while input != 'exit' do
      puts Rainbow("Enter the number of the recipe you'd like to see.").bright.dodgerblue
      puts Rainbow("Type 'list' to see them again, or 'exit' to leave.").bright.dodgerblue
      input = gets.downcase.strip

      if input.to_i.between?(1, @@all.size)
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
    Cheezme::Recipe.create_from_collection(Cheezme::Scraper.scrape_recipe_index(@@url))
    @@all = Cheezme::Recipe.all
  end

end
