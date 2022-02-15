# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



curriencies = Currency.create([
	{ title: 'thai currency', currency_code:"baht" }, 
	{ title: 'japan currency', currency_code:"yen" }, 
	{ title: 'singapore currency', currency_code:"dollar" }
])
Country.destroy_all
countries = Country.create([
	{ title: 'Thailand', country_code:"TH" }, 
	{ title: 'Japan', country_code:"JP" }, 
	{ title: 'Singapore', country_code:"SG" }
])

Tax.destroy_all
taxes = Tax.create([
	{ title: '7 percents', tax_category:"Sales Tax" }, 
	{ title: '5 percents', tax_category:"Sales Tax" }, 
	{ title: '10 percents', tax_category:"Sales Tax" }
])

Store.destroy_all
stores = Store.create([
	{ title: 'store A', region_id:"1" }, 
	{ title: 'store B', region_id:"2" }, 
	{ title: 'store C', region_id:"3" }
])

Region.destroy_all
regions = Region.create([
	{ title: 'Southeast Asia Region', country_id:"1",currency_id:"1",tax_id:"1"}, 
	{ title: 'Northeast Asia Region', country_id:"2",currency_id:"2",tax_id:"2"},
	{ title: 'Southeast Asia Region', country_id:"3",currency_id:"3",tax_id:"3"},
])


User.destroy_all
users = User.create([
	{ email: 'Adminhtoo', password:"password", user_role_id:"1" }, 
	{ email: 'Customerhtoo', password:"password", user_role_id:"2" }
])


UserRole.destroy_all
user_roles = UserRole.create([
	{ title: 'Admin', description:"These users are responsible to manage regions, products." }, 
	{ title: 'Customer', description:"Basic users who can signup and login with email and password." }
])


# PRODUCT
Product.destroy_all
product1 = Product.create({:title=>"tomato", :price => 1})
product2 = Product.create({:title=>"milk", :price => 3})
product3 = Product.create({:title=>"bread", :price => 5.50})
product4 = Product.create({:title=>"bacon", :price => 10})
product5 = Product.create({:title=>"cheese", :price => 3.20})

puts "Total number of products: #{Product.all.count}"
puts "Product titles: #{Product.all.pluck("title")}"
puts "Product1: #{product1.title} price: #{product1.price.round(2)}"
puts "Product2: #{product2.title} price: #{product2.price.round(2)}"
puts "Product3: #{product3.title} price: #{product3.price.round(2)}"
puts "Product4: #{product4.title} price: #{product4.price.round(2)}"
puts "Product5: #{product5.title} price: #{product5.price.round(2)}"

Cart.destroy_all
