# Seeds creation with faker gem and comments during process
require 'faker'
puts "************************************************"
puts "Cleaning Database"
puts "************************************************"
Review.destroy_all
Skill.destroy_all
SkillLvl.destroy_all
Reservation.destroy_all
Profile.destroy_all
User.destroy_all
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

skills.each do |skill|
  Skill.create!(name: skill)
end

puts "Skills defined"
puts "************************************************"

pwd = "123456"
# Main Users
%w(Rouge Bleu Vert Noir Rose).each do |color|
  admin = User.new( first_name: "Admin",
                    last_name: color,
                    email: "admin.#{color.downcase}@gmail.com",
                    password: pwd,
                  )
  url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyeisppd1vV8bwCdm-JYZqk5PsykywsqL70zyEV1s_oIAZ-ea43kxl9Es"
  if Rails.env.production?
      admin.photo_url = url
  end
  admin.save
  puts "admin #{color} created, ID: #{admin.id}"
end
streets = [ "rue Massena",
            "rue des Ponts de Comine",
            "rue de Béthune",
            "rue de Paris",
            "rue des Stations",
            "rue d'Antin",
            "quai de l'ouest",
            "avenue du Peuple Belge",
            "rue de Gand",
            "rue de la Monnaie",
            "boulevard de la Liberté",
            "rue Léon Gambetta",
            "avenue Oscar Lambret",
            "rue des Glycines",
            "rue de l'Asie",
            "rue du 8 mai 1945"
          ]
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
  # Developper creations
  u = User.new( first_name: first_name,
                last_name: last_name,
                # photo: photo,
                email: "#{first_name}.#{last_name.gsub(" ", "-")}666@gmail.com",
                password: pwd
                )
  if Rails.env.production?
    u.photo_url = url
  end
  u.save!
  print first_name + " " + last_name + " was born"
  # Profile creation
  city = ["Lille", "Paris"]

  profile = Profile.create!(price: price,
                            url: "www.lewagon.org",
                            description: Faker::Lorem.paragraph(2..5),
                            address: "#{(1..30).to_a.sample} #{streets.sample}",
                            city: city.sample,
                            postcode: "59800",
                            phone: "0320304050",
                            lng: 0.00,
                            lat: 0.00,
                            user_id: u.id
                            )
# skill level creation
(1..3).to_a.sample.times do
  skill_level = SkillLvl.create!(profile: profile,
                                lvl: (1..5).to_a.sample,
                                skill: Skill.all.sample,
                  )
end

  print " and has now a profile,"
  # Reviews creation
  (3..13).to_a.sample.times do
    review_count += 1
    review = Review.create!(rating: (1..5).to_a.sample,
                            description: Faker::Lorem.paragraph,
                            user: User.first(5).to_a.sample,
                            profile_id: profile.id
                            )
  end
  puts " with #{review_count} reviews."
end
puts "************************************************"
puts "Dirty work done"
puts "************************************************"

