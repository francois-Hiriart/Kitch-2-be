# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "start"

Kitchen.create!(name: "Cuisine du 11ème", location: "2 rue Oberkampf 75011", price: 55, equipments: "four, plaques à induction, micro-ondes, grand plan de travail en bois", size: 10, availability: true, description: "cuisine spacieuse et fermé avec une fenêtre donnant sur une cour intérieure", picture: "app/assets/images/cuisine_du_11ème.jpeg")
Kitchen.create!(name: "Cuisine de chef", location: "5 rue De Levy 75017", price: 122, equipments: "four, gazinière, micro-ondes, plan de travail en marbre, Thermomix à disposition", size: 15, availability: true, description: "cuisine ouverte sur le salon, possibilité de cuisiner à plusieurs", picture: "app/assets/images/cuisine_de_chef.jpeg")
Kitchen.create!(name: "Cuisine Nordique", location: "12 rue Esquermoise 59000", price: 40, equipments: "four, plaques vitro céramique, micro-ondes, plan de travail en bois, couteaux janponais à disposition", size: 12, availability: true, description: "cuisine ouverte sur le salon, possibilité de cuisiner à plusieurs", picture: "app/assets/images/cusine-nordique")
Kitchen.create!(name: "Cuisine d'été", location: "12 rue Du vieux port Marseille", price: 30, equipments: "four, gazinière, micro-ondes, plan de travail en bois, barbecure, four à Pizza", size: 10, availability: true, description: "cuisine ouverte sur l'extérieur semi abritée", picture: "app/assets/images/cusine-extérieure")
Kitchen.create!(name: "Cuisine japonaise", location: "3 rue Du vieux port Marseille", price: 45, equipments: "four, gazinière, micro-ondes, plan de travail en bois", size: 13, availability: true, description: "cuisine tout en bois d'inspiration japaonaise pour cuisiner à plusieurs en toute sérénité", picture: "app/assets/images/cusine-inspiration-japonaise")

puts "end"
