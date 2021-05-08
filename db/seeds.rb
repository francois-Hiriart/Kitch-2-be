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

kitchen_description = ["bel espace pour cuisiner en famille ou entre amis. De nombreux équipements à disposition et possibilité de profiter de la terrasse.",
  "grande cuisine moderne avec équiments de grande qualité. Espace fermé pour cuisiner en toute intimité.",
  "cuisine en bois et marbre pour cusiner dans une ambiance cosy. Possibilité d'utiliser la vaisselle ainsi que les nombreux ustensiels.",
  "cuisine ouverte sur un grand salon. Les équipements sont neufs (cuisine refaîte il y a moins d'un an) et de nombreux ustensiles de grande qualité à disposition tel qu'un thermomix."]
kitchen_list = ["Cuisine moderne", "cuisine dans le jardin", "cuisine d'été", "Cuisine italienne pour pizza", ]

city_list = ["Paris 11ème", "Saint-Denis", "Puteaux", "Paris 12ème", "paris 15ème" ]
photo_list = ["https://www.oppeinhome.com/uploads/20190408/Modern-Open-White-Lacquer-Kitchen-Cabinet-OP15-L28-north-Europe.jpg",
    "https://static.cotemaison.fr/medias_11943/w_1500,h_1500,c_crop,x_63,y_0/w_600,h_600,c_fill,g_north/v1583789155/tendance-outdoor-avec-une-cuisine-a-lesprit-naturel_6115088.jpg",
    "https://homeardenne.com/wp-content/uploads/2020/08/cuisine-exterieure-amenagement-1024x768.jpg",
    "https://images.unsplash.com/photo-1564936281403-f92f66f89ee0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=4193&q=80",
  ]
i = 0

puts "Creating users"
user1 = User.create!(user_name: Faker::Name.name, email: Faker::Internet.email, password: "password")
user2 = User.create!(user_name: "Michel Bernard", email: "test@test.com", password: "azerty")

puts "Creating kitchens"
photo_list.each do |photo|
 photo = URI.open(photo)
 kitchen = Kitchen.new(name: kitchen_list[i],
  location: city_list[i],
  price: Faker::Number.number(digits: 2),
  equipments: Faker::Appliance.equipment,
  size: Faker::Number.number(digits: 2),
  availability: true,
  description: kitchen_description[i],
  user: [user1, user2].sample)
  kitchen.picture.attach(io: photo, filename: "kitchen photo", content_type: "images/jpg")
  kitchen.save!
  i += 1
end







