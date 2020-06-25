# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.delete_all

Product.create!(
	title:       'The iPhone 11',
	description: 'A new <b>dual‑camera</b> system captures more of what you see and love. The <b>fastest</b> chip ever in a smartphone and all‑day battery life let you do more and charge less. And the <b>highest‑quality video</b> in a smartphone, so your memories look better than ever.',
	image_url:   'iPhone11.jpeg',
	price:       449.0
	)

Product.create!(
	title:       'The iPhone SE',
	description: 'iPhone SE packs our most powerful chip into our most popular size at our <b>most affordable price</b>. It’s just what you’ve been waiting for.',
	image_url:   'iPhoneSE.jpeg',
	price:       399.0
	)