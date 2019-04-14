class Recipe
	attr_accessor :name, :url, :description, :stars, :reviews, \
		:ingredients, :cook, :cook_url
	@@all = []

	def initialize(attr_hash)
		attr_hash.each do |key, value|
			self.send("#{key}=", value)
		end
		@@all << self
		# need self.cook=
	end

	def self.create_from_collection(array)
		array.each do |hash|
			Recipe.new(hash)
		end
	end

	def self.all
		@@all
	end

	def extend_attributes(attr_hash)
		attr_hash.each do |key, value|
			self.send("#{key}=", value)
		end
		# self might need to be returned here.
	end

end