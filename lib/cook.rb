class Cook.rb
	attr_accessor :name, :recipes, :url, :about
	@@all = []
	# construct from url
	# recipes should be list of recipe objects
	# construct a recipe from its url, which should just mean
    # passing it a scraped hash
	
	def initialize(attr_hash)
		attr_hash.each do |key, value|
			self.send("#{key}=", value)
		end
		@@all << self
	end

	def self.create_from_url(cook_url)
	end

	def self.all
		@@all
	end
end
