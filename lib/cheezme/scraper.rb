class Cheezme::Scraper


  def self.scrape_recipe_index(index_url)
    doc = Nokogiri::HTML(open(index_url))
    cards = doc.css('article.fixed-recipe-card')
    recipes = []
    cards.each do |card|
      recipes << {
        name: card.css('span.fixed-recipe-card__title-link').text,
        url: card.css('a').attr('href').text,
        description: card.css('div.fixed-recipe-card__description').text.strip,
        stars: card.css('div.fixed-recipe-card__ratings span').attr('data-ratingstars').text.to_f.round(2),
        reviews: card.css('span.fixed-recipe-card__reviews').children.attribute('number').text.to_i,
        cook: card.css('ul.cook-submitter-info li h4').text,
        cook_url: card.css('div.fixed-recipe-card__profile a').attr('href').text
    }
    end
    recipes
  end

  def self.scrape_recipe_page(recipe_url)
    attr_hash = {}
    doc = Nokogiri::HTML(open(recipe_url))
    prep_info = doc.css('li.prepTime__item')
    if prep_info[1].respond_to? :attr # Recipe #7 is wonky on first or second scrape
      # It usually works after a retry or two
      prep_time = prep_info[1].attr('aria-label')
      cook_time = prep_info[2].attr('aria-label')
    end

    attr_hash = {
      prep_time: prep_time,
      cook_time: cook_time,
      ingredients: [],
      steps: []
    }

    doc.css('li.checkList__line label').select {|i| i.attr('title') != nil}.each do |ing|
      attr_hash[:ingredients] << ing.attr('title')
    end

    doc.css('span.recipe-directions__list--item').each do |step|
      attr_hash[:steps] << step.text.strip.gsub(/\n\s+Watch Now$/, '')
    end
    attr_hash[:steps].pop
    attr_hash
  end

  def self.scrape_cook_page(cook_url)
  end

end
