require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper


  def self.scrape_recipe_index(index_url)
    doc = Nokogiri::HTML(open(index_url))
    cards = doc.css('article.fixed-recipe-card')
    recipes = []
    cards.each do |card|
      recipes << {
        name: card.css('span.fixed-recipe-card__title-link').text.to_sym,
        url: card.css('a').attr('href').text,
        description: card.css('div.fixed-recipe-card__description').text,
        stars: card.css('div.fixed-recipe-card__ratings span').attr('data-ratingstars').text.to_f.round(2),
        reviews: card.css('span.fixed-recipe-card__reviews').children.attribute('number').text.to_i,
        img_url: card.css('img.fixed-recipe-card__img').attr('data-original-src').text,
        cook: card.css('ul.cook-submitter-info li h4').text.gsub(/^By\ /, ''),
        cook_url: card.css('div.fixed-recipe-card__profile a').attr('href').text
    }
    end
    recipes
  end

  def self.scrape_recipe_page(recipe_url)
  end

  def self.scrape_cook_page(cook_url)
  end

end


Scraper.scrape_recipe_index("https://www.allrecipes.com/recipes/509/main-dish/pasta/macaroni-and-cheese/")
