class Cheezme::Recipe
  attr_accessor :name, :url, :description, :stars, :reviews, \
    :ingredients, :cook, :cook_url, :prep_time, :cook_time, \
    :steps, :color
  @@all = []

  def initialize(attr_hash)
    attr_hash.each do |key, value|
      self.send("#{key}=", value)
    end
    case @stars
    when 4.5..999
      @color = "lime"
    when 4.25...4.5
      @color = "gold"
    when -Float::INFINITY...4.25
      @color = "orangered"
    else
      @color = "blue"
    end

    @@all << self
  end

  def self.create_from_collection(array)
    array.each do |hash|
      Cheezme::Recipe.new(hash)
    end
  end

  def self.all
    @@all
  end

  def extend_attributes(attr_hash)
    attr_hash.each do |key, value|
      self.send("#{key}=", value)
    end
  end

  def print_ingredients_and_directions
    puts Rainbow("\nYou've chosen ").bright.lemonchiffon + Rainbow("#{@name}").send("#{@color}") + \
    Rainbow(" #{@cook}.").lightblue.bright + Rainbow("\n#{@description}\n").bright.lemonchiffon
    puts Rainbow("#{@stars} stars\t#{@reviews} reviews.").send("#{@color}").bright
    puts Rainbow("\n#{@prep_time}\n#{@cook_time}").lightblue.bright
    puts Rainbow("\nINGREDIENTS:").underline.lightblue.bright
    #puts "\nTo get started, you'll need the following ingredients:"
    @ingredients.each do |ingredient|
      puts Rainbow("    •").lightblue.bright + \
      Rainbow(" #{ingredient}").lemonchiffon.bright
    end

    puts Rainbow("\nDIRECTIONS:").underline.lightblue.bright
    @steps.each.with_index(1) do |step, i|
      puts Rainbow("    #{i}.").lightblue.bright + \
      Rainbow(" #{step}").lemonchiffon.bright
    end
    puts
  end


end
