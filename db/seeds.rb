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


countries = Country.create([
	{ title: 'Thailand', country_code:"TH" }, 
	{ title: 'Japan', country_code:"JP" }, 
	{ title: 'Singapore', country_code:"SG" }
])


taxes = Tax.create([
	{ title: '7 percents', tax_category:"Sales Tax" }, 
	{ title: '5 percents', tax_category:"Sales Tax" }, 
	{ title: '10 percents', tax_category:"Sales Tax" }
])


stores = Store.create([
	{ title: 'store A', region_id:"1" }, 
	{ title: 'store B', region_id:"2" }, 
	{ title: 'store C', region_id:"3" }
])


regions = Region.create([
	{ title: 'Southeast Asia Region', country_id:"1",currency_id:"1",tax_id:"1"}, 
	{ title: 'Northeast Asia Region', country_id:"2",currency_id:"2",tax_id:"2"},
	{ title: 'Southeast Asia Region', country_id:"3",currency_id:"3",tax_id:"3"},
])



