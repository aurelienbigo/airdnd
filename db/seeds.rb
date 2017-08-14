wagon_users = [
  {first_name: "Aubry", last_name: "Prieur"},
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
]

skills = ["Passe super bien l'aspirateur",
          "Toujours à l'heure",
          "Pro de l'écoute attentive",
          "Mettez-moi un clavier dans ... les mains pour voir",
          "Barique à bière"
        ]

pwd = "123456"
email = "truc@machin.com"

User.destroy_all
puts 'All users destroyed'

wagon_users.each do |user|
  u = User.create!(first_name: user[:first_name],
              last_name: user[:last_name],
              email: email,
              password: pwd
              )
  puts '#{user[:first_name]} created'
  profile = Profile.create!(prices: (10..30).to_a.sample,
                            url: "www.lewagon.org",
                            description: Faker::Lorem.paragraph(2..5),
                            address: Faker::Address.street_address,
                            city: Faker::Address.city,
                            postcode: (10000..99000).to_a.sample,
                            phone: "0320304050",
                            lng: 0.00,
                            lat: 0.00,
                            )
  (3..13).to_a.sample.times do
    review = Review.create!(rating: (0..5).to_a.sample),
                            description: Faker::Lorem.paragraph,
                            user_id: u.id,
                            profile_id: profile.id
                            )
  end
end

