# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#taprooms
call_to_arms = Taproom.create!(name: "Call to Arms Brewing", address: "4526 Tennyson St, Denver CO 80212", website: "calltoarmsbrewing.com", phone_number: "720-328-8258", established: "2014", number_of_employees: 7, serving_capacity: 90, offers_food: false)
ratio = Taproom.create!(name: "Ratio Beerworks", address: "2920 Larimer St, Denver, CO 80205", website: "ratiobeerworks.com", phone_number: "303-997-8288", established: "2014", number_of_employees: 12, serving_capacity: 100, offers_food: false)
cerebral = Taproom.create!(name: "Cerebral Brewing", address: "1477 Monroe St, Denver, CO 80206", website: "cerebralbrewing.com", phone_number: "303-865-7341", established: "2015", number_of_employees: 8, serving_capacity: 70, offers_food: false)
dbc = Taproom.create!(name: "Denver Beer Co", address: "1695 Platte St, Denver, CO 80202", website: "denverbeerco.com", phone_number: "720-279-8247", established: "2011", number_of_employees: 15, serving_capacity: 150, offers_food: true)
hogshead = Taproom.create!(name: "Hogshead Brewing", address: "4460 West 29th Ave, Denver, CO 80212", website: "hogshead54.com", phone_number: "303-495-3105", established: "2012", number_of_employees: 6, serving_capacity: 45, offers_food: true)




# beers
ballroom = call_to_arms.beers.create!(name: "Ballroom Beer", style: "American Light Lager", medal_winner: false, abv: 5.0, price: 500)
janet_reno = call_to_arms.beers.create!(name: "Janet Reno's Dance Party", style: "Hazy IPA", medal_winner: false, abv: 7.0, price: 700)
oats_n_hoes = call_to_arms.beers.create!(name: "Oats 'n' Hoes", style: "American Porter", medal_winner: false, abv: 7.5, price: 800)
cherry_freedom_fries = call_to_arms.beers.create!(name: "Cherry Freedom Fries", style: "Cherry Saison", medal_winner: true, abv: 4.8, price: 700)
cta_ipa = call_to_arms.beers.create!(name: "CTA IPA", style: "Denver IPA", medal_winner: false, abv: 6.5, price: 700)


chinwag = hogshead.beers.create!(name: "Chin Wag", style: "Extra Special Bitter", medal_winner: false, abv: 6.5, price: 750)
gilpin_black = hogshead.beers.create!(name: "Gilpin Black Gold", style: "London Porter", medal_winner: false, abv: 6.3, price: 700)
lake_lightning = hogshead.beers.create!(name: "Lake Lightning", style: "Light Pale Ale", medal_winner: false, abv: 5.5, price: 650)

princess_yum_yum = dbc.beers.create!(name: "Princess Yum Yum", style: "Raspberry Kolsch", medal_winner: true, abv: 4.8, price: 650)
graham_cracker_porter = dbc.beers.create!(name: "Graham Cracker Porter", style: "Porter", medal_winner: true, abv: 5.6, price: 600)
peach_daddy = dbc.beers.create!(name: "Peach Daddy Cobbler", style: "Peach Cobbler Ale", medal_winner: false, abv: 5.0, price: 600)
juicy_freak = dbc.beers.create!(name: "Juicy Freak", style: "Juicy IPA", medal_winner: false, abv: 6.5, price: 700)
incredible_pedal = dbc.beers.create!(name: "Incredible Pedal", style: "IPA", medal_winner: false, abv: 7.0, price: 700)

rare_trait = cerebral.beers.create!(name: "Rare Trait", style: "IPA", medal_winner: false, abv: 6.4, price: 800)
muscle_memory = cerebral.beers.create!(name: "Muscle Memory", style: "Pale Ale", medal_winner: false, abv: 5.2, price: 700)
peach_brandy = cerebral.beers.create!(name: "Peach Brandy Barrel-Aged Cryptic Message", style: "Barrel-Aged Black Lager", medal_winner: false, abv: 6.8, price: 900)
dark_galaxie = cerebral.beers.create!(name: "Dark Galaxie", style: "Oatmeal Stout", medal_winner: false, abv: 6.4, price: 800)
character_reference = cerebral.beers.create!(name: "Character Reference", style: "Vienna Lager", medal_winner: false, abv: 5.5, price: 700)

domestica = ratio.beers.create!(name: "Domestica", style: "American Golden Ale", medal_winner: false, abv: 4.9, price: 650)
cityscapes = ratio.beers.create!(name: "Cityscapes", style: "Mexican Lager", medal_winner: false, abv: 4.8, price: 650)
antidote = ratio.beers.create!(name: "Antidote", style: "West Coast IPA", medal_winner: false, abv: 7.0, price: 700)
king_of_carrot_flowers = ratio.beers.create!(name: "King of Carrot Flowers", style: "Carrot and Elderflower Saison", medal_winner: false, abv: 5.9, price: 800)
hold_steady = ratio.beers.create!(name: "Hold Steady", style: "Dark Scotch Ale", medal_winner: false, abv: 7.5, price: 800)

