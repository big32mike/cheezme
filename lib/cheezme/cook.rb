# I originally thought I needed to setup object relationships
# This class would have tied a cook to a recipe
# It's currently unused
class Cheezme::Cook
	attr_accessor :name, :recipes, :url, :about
	@@all = []

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
