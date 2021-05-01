# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating kitchens"
Kitchen.create!([{ name: 'Big Bang' },{ location: 'Paris' }, { price: 100 }, { equipments: 'Food storage containers, Juicers,Electric Kettle' }, { size: 5 }, { availability: true }, {description: 'American Kitchen with full equipment, can accomordate max 5 people' }, { picture: 'https://101recycledcrafts.com/wp-content/uploads/2016/09/american-style-kitchen-decorations-9.jpg' }])
Kitchen.create!([{name:'KeTEE'},{location:'London'},{price: 80 },{equipments:'Blender,Water Purifier, Dishwasher, Slow Cooker, Fridges, Rice cooker'},{size:3},{availability:true},{description:'Nice kitchen in downtown Londonwith'},{picture:'https://www.oppeinhome.com/uploads/20190408/Modern-Open-White-Lacquer-Kitchen-Cabinet-OP15-L28-north-Europe.jpg ' }])
Kitchen.create!([{name:'S family kitchen'},{location: 'Paris' },{price:120},{equipments:'full equipments'},{size:6},{availability:true},{description:'Big kitchen for family and friends party prep'},{picture:'https://www.oppeinhome.com/uploads/20190408/Shaker-Style-U-Shaped-Navy-Blue-Kitchen-OP18-L03-country-style.jpg'}])
Kitchen.create!([{name:'M&J Kitchen'},{location:'Paris'},{price:200},{equipments:'Mixing Bowls, Stand mixers, Colander, Food processor, Oven, Pressure Cooker'},{size:5},{availability:true},{description:'American Kitchen with full equipment, can accomordate max 5 people'},{picture:'https://media01.living4media.com/largepreviews/MzUyODg3NTA4/11383468-Open-plan-American-style-kitchen-with-black-worksurface-and-breakfast-bar-with-bar-stools.jpg'}])
Kitchen.create!([{name:'Gigi'},{location:'New York'},{price:110},{equipments:'Mixing Bowls, Stand mixers, Colander, Fridges'},{size:5},{availability:true},{description:'American Kitchen with full equipment, can accomordate max 5 people'},{picture:'https://st.hzcdn.com/simgs/pictures/kitchens/farmers-hampton-style-kitchens-farmers-img~37c141bd05136749_14-5611-1-3980b54.jpg'}])
Kitchen.create!(name: "Cuisine avec grand plan de travail", location: "Paris", price: 28, equipments: "", size: 20, availability: true,	description: "Cuisine avec espace de travail. Parfait pour toute les recettes demandant beaucoup d'espace. Cette cuisine vous permet de cuisiner à 2 ou 3 maximum",	picture: "https://images.unsplash.com/photo-1556911220-bff31c812dba?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1135&q=80",	user_id: "")
Kitchen.create!(name: "Cuisine italienne pour pizza", location: "Paris", price: 36, equipments: "", size: 18, availability: true, description: "Cuisine spécialement conçpour la cuisine italienne. Vous pourrez faire des pizzas et calzone grace au beau four à feu de bois", picture: "https://images.unsplash.com/photo-1607375651527-ad191b70631d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",user_id: "")
Kitchen.create!(name: "Location avec cours", location: "Paris", price: 55, equipments: "", size: 28, availability: true, description: "Dans ce cours, je vais vous apprendre à faire des crêpes soufflées japonaises à partir de zéro. Les crêpes soufflées japonaises sont un régal léger, moelleux et alléchant qui sont servis dans les cafés partout au Japon. Ces crêpes sont un ajout amusant à votre répertoire de petit-déjeuner, brunch ou dessert. Étant donné que faire ces crêpes peut être délicat, nous ferons les crêpes une à la fois pour les pratiquer et je vous apprendrai tous les conseils dont vous avez besoin pour faire les crêpes parfaites. Au total, nous ferons 2 crêpes moelleuses.", picture: "https://images.unsplash.com/photo-1542967149-527e8af3ed35?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80", user_id: "")

puts "Kitchens created"
