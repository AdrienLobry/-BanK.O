
Restaurant.destroy_all

puts 'Cleaning Restaurant DB'

5.times do
  restaurant = Restaurant.new(
    name: "l'assiette du marché",
    address: "25 rue de poivreaux, 59000 Lille",
    phone_number: "0625252525",
    photo: "https://imgs.search.brave.com/bN4lKF8N1VZ4BGntVgfuIOvvW7kjFDRvmS7Jk-paHe4/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly93d3cu/cGFnZXNqYXVuZXMu/ZnIvbWVkaWEvYWdj/L2Nyb3AvMjAweDIw/MC8xMi80ZS85NS8w/MC8wMC82Yi80My83/OC9lOC85Ni82MTA1/MTI0ZTk1MDAwMDZi/NDM3OGU4OTYvNjEw/NTEyNGU5NTAwMDA2/YjQzNzhlODk3Lmpw/Zz92PTI",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Ò"
  )
  restaurant.save

  puts "#{restaurant.name} Has been Created !"
end

  puts "#{Restaurant.count} Has been Created ! "


Recipe.destroy_all

puts 'Cleaning Recipe DB'

5.times do
  recipe = Recipe.new(
    name: "Le Welsch",
    description: "Etape 1 Faire dorer le pain dans une poêle avec un peu de beurre. Etape 2 Mettre le cheddar en petits cubes dans une sauteuse, ajoutez la bière et la muscade et laissez fondre, puis, ajouter les oeufs battus hors du feu. Etape 3 Dans un plat à gratin, déposez le jambon sur le pain, et versez la préparation sur l'ensemble. Etape 4 Mettre du gruyère râpé pour gratiner le plat. Etape 5 Mettre au four 3 min environ en position gril.",
    photo: "https://assets.afcdn.com/recipe/20200113/106493_w1024h768c1cx640cy360cxt0cyt0cxb1280cyb720.png"
  )
 recipe.save

 puts "#{recipe.name} Has been Created !"
end

  puts "#{Recipe.count} Has been Created !"

Meal.destroy_all

puts 'Cleaning Meal DB'

5.times do
 meal = Meal.new(
  name: "Le Welsch",
  description: "Le welsh, aussi appelé welsh rabbit ou welsh rarebit1 ou parfois croque gallois2, est un plat d'origine galloise, à base de cheddar fondu (originellement, on utilisait du chester, maintenant, on utilise plus du cheddar Galloway).

  Il est traditionnellement servi sur une tranche de pain grillé et passé au four. En France, le welsh est typiquement servi dans les brasseries du Nord et du Pas-de-Calais, où il est désormais bien ancré dans la culture régionale.",
  photo: "https://assets.afcdn.com/recipe/20200113/106493_w1024h768c1cx640cy360cxt0cyt0cxb1280cyb720.png",
  localisation: "4 Av. des Saules Euratechnologies - Doge B, 59160 Lille",
  recipe: Recipe.first
 )
 meal.save

 puts "#{meal.name} Has been Created !"
end

  puts "#{Meal.count} Has been Created !"

meal = Meal.new(
  name: "Le Bar En Croute",
  description: "Le welsh, aussi appelé welsh rabbit ou welsh rarebit1 ou parfois croque gallois2, est un plat d'origine galloise, à base de cheddar fondu (originellement, on utilisait du chester, maintenant, on utilise plus du cheddar Galloway).

  Il est traditionnellement servi sur une tranche de pain grillé et passé au four. En France, le welsh est typiquement servi dans les brasseries du Nord et du Pas-de-Calais, où il est désormais bien ancré dans la culture régionale.",
  photo: "https://assets.afcdn.com/recipe/20200113/106493_w1024h768c1cx640cy360cxt0cyt0cxb1280cyb720.png",
  localisation: "70 Bd Sainte-Beuve, 62200 Boulogne-sur-Mer",
  recipe: Recipe.first
  )
  meal.save
