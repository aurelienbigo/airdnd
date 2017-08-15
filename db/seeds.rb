# Seeds creation with faker gem and comments during process

puts "************************************************"
puts "Cleaning Database"
puts "************************************************"
Review.destroy_all
Skill.destroy_all
SkillLvl.destroy_all
Reservation.destroy_all
Profile.destroy_all
User.destroy_all
puts "************************************************"
puts 'Database destroyed'
puts "************************************************"
puts "Seeding work start"
puts "************************************************"

skills = ["Bûcheron style",
          "Barbe courte",
          "Barbe longue",
          "Espadrilles",
          "Tong",
          "Bonnet",
          "Imberbe",
          "Tenue de plage",
          "Ogre",
          "Petit modèle",
          "Taille normale",
          "Grand modèle",
          "Sobre",
          "Loin d'être sobre"]


pwd = "123456"
wagon_users = [
  {first_name: "Aubry", last_name: "Prieur", url: "http://res.cloudinary.com/aurelbigo/image/upload/v1502727666/aubry_qznylg.png" },
  {first_name: "Augustin", last_name: "Poupard", url: "http://res.cloudinary.com/aurelbigo/image/upload/v1502727667/poupard_idskpa.jpg"},
  {first_name: "Aurélien", last_name: "Bigo", url: "http://res.cloudinary.com/aurelbigo/image/upload/v1502727850/aurel_d9xf5t.jpg"},
  {first_name: "Bertrand", last_name: "Matelart", url: "http://res.cloudinary.com/aurelbigo/image/upload/v1502727666/bertrand_gz7emv.jpg"},
  {first_name: "Carl", last_name: "Quivron", url: "http://res.cloudinary.com/aurelbigo/image/upload/v1502727667/carl_bfazrs.jpg"},
  {first_name: "Clément", last_name: "Meyer", url: "http://res.cloudinary.com/aurelbigo/image/upload/v1502727850/clem_moyi9g.jpg"},
  {first_name: "Guillaume", last_name: "Trupin", url: "http://res.cloudinary.com/aurelbigo/image/upload/v1502727667/guillaume_xmi2mg.jpg"},
  {first_name: "Louis", last_name: "Fanien", url: "http://res.cloudinary.com/aurelbigo/image/upload/v1502727667/louis_fhjwl3.jpg"},
  {first_name: "Léa", last_name: "Woittequand", url: "http://res.cloudinary.com/aurelbigo/image/upload/v1502727850/lea_mglpw0.jpg"},
  {first_name: "Raphaël", last_name: "Tisne", url: "http://res.cloudinary.com/aurelbigo/image/upload/v1502727667/rpah_hadqen.jpg"},
  {first_name: "Valériane", last_name: "Venance", url: "http://res.cloudinary.com/aurelbigo/image/upload/v1502727667/valeriane_dyqbx4.jpg"},
  {first_name: "Geoffroy", last_name: "Hauwen", url: "http://res.cloudinary.com/aurelbigo/image/upload/v1502727667/geoffroy_iyhj2d.jpg"},
  {first_name: "Benjamin", last_name: "Digeon", url: "http://res.cloudinary.com/aurelbigo/image/upload/v1502727666/ben_ypsdx2.jpg"},
  {first_name: "François-Xavier", last_name: "Abraham", url: "http://res.cloudinary.com/aurelbigo/image/upload/v1502727667/Capture_d_e%CC%81cran_2017-08-14_a%CC%80_18.14.47_frpx85.png"},
  {first_name: "Gabriel", last_name: "De la Broue de Vareilles Sommière", url: "http://res.cloudinary.com/aurelbigo/image/upload/v1502727667/gab_mzlvnf.jpg"},
  {first_name: "Yann", last_name: "Irbah", url: "http://res.cloudinary.com/aurelbigo/image/upload/v1502727668/yann_huwww9.jpg"},
  {first_name: "Delphine", last_name: "Martinache", url: "http://res.cloudinary.com/aurelbigo/image/upload/v1502727667/gab_mzlvnf.jpg"},
  {first_name: "Eugène", last_name: "Frys", url: "http://res.cloudinary.com/aurelbigo/image/upload/v1502727667/gab_mzlvnf.jpg"},
  {first_name: "Martin", last_name: "Debrunne", url: "http://res.cloudinary.com/aurelbigo/image/upload/v1502727667/gab_mzlvnf.jpg"},
  {first_name: "Romain", last_name: "Despature", url: "http://res.cloudinary.com/aurelbigo/image/upload/v1502727667/gab_mzlvnf.jpg"},
  {first_name: "Vincent", last_name: "Textoris", url: "http://res.cloudinary.com/aurelbigo/image/upload/v1502727667/gab_mzlvnf.jpg"}
]
wagon_users.each do |user|
  first_name = user[:first_name]
  last_name = user[:last_name]
  url = user[:url]
  review_count = 0
  price = (10..30).to_a.sample
  # User creation
  u = User.new( first_name: first_name,
                    last_name: last_name,
                    # photo: photo,
                    email: "#{first_name}.#{last_name.gsub(" ", "-")}@gmail.com",
                    password: pwd
                    )
  u.photo_url = url
  u.save!
  print first_name + " " + last_name + " was born"
  # Profile creation
  profile = Profile.create!(price: price,
                            url: "www.lewagon.org",
                            description: Faker::Lorem.paragraph(2..5),
                            address: Faker::Address.street_address,
                            city: Faker::Address.city,
                            postcode: (10000..99000).to_a.sample,
                            phone: "0320304050",
                            lng: 0.00,
                            lat: 0.00,
                            user_id: u.id
                            )
  print " and has now a profile,"
  # Reviews creation
  (3..13).to_a.sample.times do
    review_count += 1
    review = Review.create!(rating: (1..5).to_a.sample,
                            description: Faker::Lorem.paragraph,
                            user_id: u.id,
                            profile_id: profile.id
                            )
  end
  puts " with #{review_count} reviews."
end
puts "************************************************"
puts "Dirty work done"
puts "************************************************"

