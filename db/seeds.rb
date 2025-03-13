# Clear existing data
MealRestaurant.destroy_all
Meal.destroy_all
Recipe.destroy_all
Restaurant.destroy_all

# Create Recipes from JSON
recipes_data = JSON.parse(File.read(Rails.root.join('db', 'recettes_lille.json')))['recipe']
recipes_data.each do |recipe_data|
  Recipe.create!(
    name: recipe_data['name'],
    description: recipe_data['description'],
    photo: recipe_data['photo']
  )
end

# Create Meals from JSON
meals_data = JSON.parse(File.read(Rails.root.join('db', 'recettes_lille.json')))['meal']
meals_data.each do |meal_data|
  recipe = Recipe.find_by(name: meal_data['name'])
  Meal.create!(
    name: meal_data['name'],
    description: meal_data['description'],
    photo: meal_data['photo'],
    localisation: meal_data['localisation'],
    recipe_id: recipe.id
  )
end

# Create Restaurants from JSON
restaurants_data = JSON.parse(File.read(Rails.root.join('db', 'recettes_lille.json')))['restaurant']
restaurants_data.each do |restaurant_data|
  Restaurant.create!(
    name: restaurant_data['name'],
    phone_number: restaurant_data['phone_number'],
    photo: restaurant_data['photo'],
    address: restaurant_data['address'],
    description: restaurant_data['description']
  )
end

# Create MealRestaurant associations
restaurants_data.each do |restaurant_data|
  restaurant = Restaurant.find_by(name: restaurant_data['name'])
  restaurant_data['menu'].each do |meal_name|
    meal = Meal.find_by(name: meal_name)
    MealRestaurant.create!(
      meal_id: meal.id,
      restaurant_id: restaurant.id
    )
  end
end

puts "Seeding completed successfully!"
