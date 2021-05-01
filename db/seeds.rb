require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Kitchen.create!(name: "Cuisine du 11ème", location: "2 rue Oberkampf 75011", price: 55, equipments: "four, plaques à induction, micro-ondes, grand plan de travail en bois", size: 10, availability: true, description: "cuisine spacieuse et fermé avec une fenêtre donnant sur une cour intérieure", picture: "app/assets/images/cuisine_du_11ème.jpeg")
# Kitchen.create!(name: "Cuisine de chef", location: "5 rue De Levy 75017", price: 122, equipments: "four, gazinière, micro-ondes, plan de travail en marbre, Thermomix à disposition", size: 15, availability: true, description: "cuisine ouverte sur le salon, possibilité de cuisiner à plusieurs", picture: "app/assets/images/cuisine_de_chef.jpeg")
# Kitchen.create!(name: "Cuisine Nordique", location: "12 rue Esquermoise 59000", price: 40, equipments: "four, plaques vitro céramique, micro-ondes, plan de travail en bois, couteaux janponais à disposition", size: 12, availability: true, description: "cuisine ouverte sur le salon, possibilité de cuisiner à plusieurs", picture: "app/assets/images/cusine-nordique")
# Kitchen.create!(name: "Cuisine d'été", location: "12 rue Du vieux port Marseille", price: 30, equipments: "four, gazinière, micro-ondes, plan de travail en bois, barbecure, four à Pizza", size: 10, availability: true, description: "cuisine ouverte sur l'extérieur semi abritée", picture: "app/assets/images/cusine-extérieure")
# Kitchen.create!(name: "Cuisine japonaise", location: "3 rue Du vieux port Marseille", price: 45, equipments: "four, gazinière, micro-ondes, plan de travail en bois", size: 13, availability: true, description: "cuisine tout en bois d'inspiration japaonaise pour cuisiner à plusieurs en toute sérénité", picture: "app/assets/images/cusine-inspiration-japonaise")

User.destroy_all
Kitchen.destroy_all

kitchen_list = ["Cuisine avec grand plan de travail", "Cuisine italienne pour pizza", "Location avec cours", "Cuisine du monde", "Grande cuisine familiale", "Cuisine de chef", "Big Bang", "KeTEE", "family kitchen", "M&J Kitchen", "Gigi", "African Kitchen", "Indian spirit", "Japanese Wok", "Barbecue"]
city_list = ["Paris 11ème", "Saint-Denis", "Puteaux", "Paris 12ème", "paris 15ème", "Villejuif", "Saint-Mandé", "Pairs 7ème", "Paris 9ème", "Gennevilliers", "Aubervillier", "Saint-Germain-en-Laye", "Neuilly", "Levallois-Perret", "Saint-Cloud" ]
photo_list = ["https://101recycledcrafts.com/wp-content/uploads/2016/09/american-style-kitchen-decorations-9.jpg",
  "https://www.oppeinhome.com/uploads/20190408/Modern-Open-White-Lacquer-Kitchen-Cabinet-OP15-L28-north-Europe.jpg",
   "https://www.oppeinhome.com/uploads/20190408/Modern-Open-White-Lacquer-Kitchen-Cabinet-OP15-L28-north-Europe.jpg",
    "https://www.oppeinhome.com/uploads/20190408/Shaker-Style-U-Shaped-Navy-Blue-Kitchen-OP18-L03-country-style.jpg",
    "https://media01.living4media.com/largepreviews/MzUyODg3NTA4/11383468-Open-plan-American-style-kitchen-with-black-worksurface-and-breakfast-bar-with-bar-stools.jpg",
    "https://st.hzcdn.com/simgs/pictures/kitchens/farmers-hampton-style-kitchens-farmers-img~37c141bd05136749_14-5611-1-3980b54.jpg",
    "https://st.hzcdn.com/simgs/pictures/kitchens/farmers-hampton-style-kitchens-farmers-img~37c141bd05136749_14-5611-1-3980b54.jpg",
    "https://st.hzcdn.com/simgs/pictures/kitchens/farmers-hampton-style-kitchens-farmers-img~37c141bd05136749_14-5611-1-3980b54.jpg",
    "https://st.hzcdn.com/simgs/pictures/kitchens/farmers-hampton-style-kitchens-farmers-img~37c141bd05136749_14-5611-1-3980b54.jpg"]
i = 0

10.times do

puts "Creating users"

user = User.create!(user_name: Faker::Name.name, email: Faker::Internet.email, password: "password")

puts "Creating kitchens"

kitchen = Kitchen.create!(name: kitchen_list[i], location: city_list[i], price: Faker::Number.number(digits: 2), equipments: Faker::Appliance.equipment, size: Faker::Number.number(digits: 2), availability: true, description: "Cuisine avec espace de travail. Parfait pour toute les recettes demandant beaucoup d'espace. Cette cuisine vous permet de cuisiner à 2 ou 3 maximum", picture: photo_list[i], user: user)
i += 1

end

puts "Kitchens created"


