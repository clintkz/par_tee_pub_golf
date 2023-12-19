LOCATIONS = ["SW London", "Central London", "North London"]

# Course.destroy_all
# User.destroy_all
# Participant.destroy_all
# Pub.destroy_all
# Game.destroy_all


# Define Courses and their Pubs
courses = {
  "South Ken Classic" => [
    { name: "Angelsea Arms", address: "15 Selwood Terrace, South Kensington, London SW7 3QG",image: "angelsea_arms.png", drink: "Lager", strokes: "3", rules: "If in one gulp your drink goes down, you get to nominate, wear a crown. Choose a friend to take a sip, watch them raise their glass, no need to flip!" },
    { name: "Drayton Arms", address: "153 Old Brompton Rd, Greater, London SW5 0LJ", image: "beer.png", drink: "Gin and Tonic", strokes: "2", rules: "In our game, there's one more twist, no restroom breaks, don't get me amiss. Stay on the course, don't take a pit stop, or else, my friend, it's another drink to the top!" },
    { name: "Nam Long", address: "159 Old Brompton Rd, London SW5 0LJ", image: "beer.png", drink: "Flaming Ferrari", strokes: "1", rules: "Keep your left hand on your drink, no switching, don't overthink. If you lift it with your right, take a shot, oh what a sight!" }
  ],
  "The Old Course"  => [
    { name: "The Suprise, Chelsea", address: "6 Christchurch Terrace, London SW3 4AJ", drink: "Lager", strokes: "3", rules: "No foul words in this golfing spree, if you swear, take a penalty! Buy a round for all your mates, keep it clean, no verbal slates!" },
    { name: "The Sydney Arms", address: "70 Sydney St, London SW3 6NJ", image: "beer.png", drink: "Guinness", strokes: "2", rules: "Bartender's choice on the flip of a coin, let fate decide, don't you groan. If it's heads, you're in good cheer, if it's tails, take another drink, my dear!" },
    { name: "Cadogen Arms", address: "298 King's Rd, London SW3 5UG", image: "beer.png",drink: "Old Fashion", strokes: "5", rules: "Balance your glass with grace and style, walk the line, don't spill a smile. If you wobble or your drink you spill, take a penalty shot, if you will!" }
  ],
  "James Blunt" => [
    { name: "The Fox and the Pheasant", address: "1 Billing Rd, London SW10 9UJ", image: "beer.png", drink: "Guinness", strokes: "2", rules: "When I was young, at every tee, you must start each sentence, that's the decree, in a Scottish brogue, you must speak, no words astray. If you slip, take a wee sip, golf and accents, make it your way!"  },
    { name: "Hollywood Arms", address: "45 Hollywood Rd, London SW10 9HX", image: "beer.png", drink: "Vodka Lime and Soda", strokes: "3", rules: "Declare a 'silent hole,' not a peep or you pay the toll. If you utter a word, it's a penalty drink, keep your lips sealed, or to the bar, you'll slink!" },
    { name: "Maggies Club", address: "329 Fulham Rd, London SW10 9QL", image: "beer.png", drink: "Tequila", strokes: "1", rules: "On one leg, you must putt with glee, if you falter and lose your stance, add an extra shot to your score, you see!"  }
  ]
}
# Create Courses and Pubs
courses.each do |course_name, pubs|
  course = Course.create(name: course_name, number_of_pubs: 3, location: LOCATIONS.sample)
  pubs.each do |pub_info|
    Pub.create(
      name: pub_info[:name],
      address: pub_info[:address],
      drink: pub_info[:drink],
      strokes: pub_info[:strokes],
      rules: pub_info[:rules],
      course: course
    )
    puts "#{Pub.last.name} created"

  end
end
puts "#{Course.count} courses created"
# Create Users
users = [
  { email: "user1@example.com", password: "bossceo", first_name: "Vince", last_name: "McMahan" },
  { email: "user2@example.com", password: "hitman", first_name: "Shaun", last_name: "Michaels" },
  { email: "user3@example.com", password: "heartbreakkid", first_name: "Brett", last_name: "Heart"  },
  { email: "user4@example.com", password: "austin_3:16", first_name: "Steve", last_name: "Austin"  },
  { email: "user5@example.com", password: "peopleschamp", first_name: "Dwayne", last_name: "Johnson"  },
]
users.each do|user|
  User.create!(user)
end
puts "#{User.count} users created"
