# Clear existing data
# Destroy dependent records first
Favorite.destroy_all
MealRestaurant.destroy_all
Meal.destroy_all
Recipe.destroy_all
Restaurant.destroy_all

# Load JSON data
json_data = JSON.parse(File.read(Rails.root.join('db', 'recettes_lille.json')))

# Create Recipes from JSON
recipes_data = json_data['recipe']
recipes_data.each do |recipe_data|
  description = recipe_data['description']

  # Determine the steps header (Étapes : or Préparation :)
  steps_header = description.include?("Étapes :") ? "Étapes :" : "Préparation :"

  # Split the description into ingredients and steps
  if description.include?("Ingrédients :") && description.include?(steps_header)
    # Split into ingredients and steps
    ingredients_part, steps_part = description.split(steps_header)

    # Format ingredients: Wrap in a div with class 'ingredients-container'
    if ingredients_part.include?("Ingrédients :")
      ingredients = ingredients_part.split("Ingrédients :")
      formatted_ingredients = "<div class='ingredients-container'><h4 style='text-align: center; font-family: Bowlby One'>Ingrédients</h4>" + ingredients[1].gsub(/-/, "<br>-").strip + "</div>"
    else
      formatted_ingredients = "<div class='ingredients-container'>" + ingredients_part + "</div>"
    end

    # Format steps: Wrap in a div with class 'preparation-steps-container'
    formatted_steps = "<div class='preparation-steps-container'><h4 style='text-align: center; font-family: Bowlby One'>#{steps_header}</h4>" + steps_part.gsub(/(\d+\.)/, "<br>\\1").strip + "</div>"

    # Combine formatted ingredients and steps inside a parent div
    formatted_description = "<div class='recipe-content'>" + formatted_ingredients + formatted_steps + "</div>"
  else
    formatted_description = "<div class='recipe-content'>" + description + "</div>"
  end

  Recipe.create!(
    name: recipe_data['name'],
    description: formatted_description,  # Use the formatted description with divs
    photo: recipe_data['photo']
  )
  puts "Recipe created: #{recipe_data['name']}"
end

# Create Meals from JSON
meals_data = json_data['meal']
meals_data.each do |meal_data|
  recipe = Recipe.find_by(name: meal_data['name'])
  if recipe
    Meal.create!(
      name: meal_data['name'],
      description: meal_data['description'],
      photo: meal_data['photo'],
      localisation: meal_data['localisation'],
      recipe_id: recipe.id
    )
    puts "Meal created: #{meal_data['name']}"
  else
    puts "Warning: Recipe not found for meal '#{meal_data['name']}'. Skipping meal creation."
  end
end

# Create Restaurants from JSON
restaurants_data = json_data['restaurant']
restaurants_data.each do |restaurant_data|
  Restaurant.create!(
    name: restaurant_data['name'],
    phone_number: restaurant_data['phone_number'],
    photo: restaurant_data['photo'],
    address: restaurant_data['address'],
    description: restaurant_data['description']
  )
  puts "Restaurant created: #{restaurant_data['name']}"
end

# Create MealRestaurant associations
restaurants_data.each do |restaurant_data|
  restaurant = Restaurant.find_by(name: restaurant_data['name'])
  if restaurant
    restaurant_data['menu'].each do |meal_name|
      meal = Meal.find_by(name: meal_name)
      if meal
        MealRestaurant.create!(
          meal_id: meal.id,
          restaurant_id: restaurant.id
        )
        puts "Association created: #{meal_name} -> #{restaurant.name}"
      else
        puts "Warning: Meal '#{meal_name}' not found. Skipping association for restaurant '#{restaurant.name}'."
      end
    end
  else
    puts "Warning: Restaurant '#{restaurant_data['name']}' not found. Skipping associations."
  end
end

puts "Seeding completed successfully!"
