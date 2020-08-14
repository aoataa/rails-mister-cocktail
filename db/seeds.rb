# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



require 'json'
require 'open-uri'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
user_serialized = open(url).read
user = JSON.parse(user_serialized)

parsed = user["drinks"]
parsed.each do |ingredient|
  ingredient_Parsed = Ingredient.new(name: ingredient["strIngredient1"])
  ingredient_Parsed.save
end

Cocktail.new(name: "Creamy Limoncello Martini" )

