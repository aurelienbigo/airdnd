# Seeds creation with faker gem and comments during process

pwd = "123456"
puts "************************************************"
puts "Cleaning Database"
puts "************************************************"
Review.destroy_all
puts "5"
Skill.destroy_all
puts "4"
SkillLvl.destroy_all
puts "3"
Reservation.destroy_all
puts "2"
Profile.destroy_all
puts "1"
User.destroy_all
puts "************************************************"
puts 'Database destroyed'
puts "************************************************"
puts "Seeding work start"
puts "************************************************"

wagon_users = [
  {first_name: "Aubry", last_name: "Prieur" },
  {first_name: "Augustin", last_name: "Poupard"},
  {first_name: "Aurélien", last_name: "Bigo"},
  {first_name: "Bertrand", last_name: "Matelart"},
  {first_name: "Carl", last_name: "Quivron"},
  {first_name: "Clément", last_name: "Meyer"},
  {first_name: "Guillaume", last_name: "Turpin"},
  {first_name: "Louis", last_name: "Fanien"},
  {first_name: "Léa", last_name: "Woittequand"},
  {first_name: "Raphaël", last_name: "Tisne"},
  {first_name: "Valériane", last_name: "Venance"},
  {first_name: "Geoffroy", last_name: "Hauwen"},
  {first_name: "Benjamin", last_name: "Digeon"},
  {first_name: "François-Xavier", last_name: "Abraham"},
  {first_name: "Gabriel", last_name: "De la Broue de Vareilles Sommière"},
  {first_name: "Yann", last_name: "Irbah"},
  {first_name: "Delphine", last_name: "Martinache"},
  {first_name: "Eugène", last_name: "Frys"},
  {first_name: "Martin", last_name: "Debrunne"},
  {first_name: "Romain", last_name: "Despature"},
  {first_name: "Vincent", last_name: "Textoris"}
]
wagon_users.each do |user|
  first_name = user[:first_name]
  last_name = user[:last_name]
  review_count = 0
  price = (10..30).to_a.sample
  # User creation
  u = User.create!( first_name: first_name,
                    last_name: last_name,
                    email: "#{first_name}.#{last_name.gsub(" ", "-")}@gmail.com",
                    password: pwd
                    )
  print first_name + " " + last_name + " is borned"
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
    review = Review.create!(rating: (0..5).to_a.sample,
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

