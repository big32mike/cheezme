class Cheezme::Recipe
	attr_accessor :name, :url, :description, :stars, :reviews, \
		:ingredients, :cook, :cook_url, :prep_time, :cook_time, \
		:steps
	@@all = []

	def initialize(attr_hash)
		attr_hash.each do |key, value|
			self.send("#{key}=", value)
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
		# no need to return self here
	end

	def print_ingredients_and_directions
		puts "\n#{@prep_time}\n#{@cook_time}"
		puts "\nTo get started, you'll need the following ingredients:\n"
		@ingredients.each do |ingredient|
			puts "• #{ingredient}"
		end

		puts "\nTo prepare:\n"
		@steps.each.with_index(1) do |step, i|
			puts "#{i}. #{step}"
		end
		puts "\n\n\n"
	end


end
