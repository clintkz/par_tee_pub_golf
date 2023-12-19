LOCATIONS = ["SW London", "Central London", "North London"]

Course.destroy_all
User.destroy_all
Participant.destroy_all
Pub.destroy_all
Game.destroy_all


# Define Courses and their Pubs
courses = {
  "South Ken Classic" => [
    { name: "Angelsea Arms", address: "15 Selwood Terrace, South Kensington, London SW7 3QG",image: "angelsea_arms.png", drink: "Lager", strokes: "3" },
    { name: "Drayton Arms", address: "153 Old Brompton Rd, Greater, London SW5 0LJ", image: "beer.png", drink: "Gin and Tonic", strokes: "2" },
    { name: "Nam Long", address: "159 Old Brompton Rd, London SW5 0LJ", image: "beer.png", drink: "Flaming Ferrari", strokes: "1" }
  ],
  "The Old Course"  => [
    { name: "The Suprise, Chelsea", address: "6 Christchurch Terrace, London SW3 4AJ", drink: "Lager", strokes: "3" },
    { name: "The Sydney Arms", address: "70 Sydney St, London SW3 6NJ", image: "beer.png", drink: "Guinness", strokes: "2" },
    { name: "Cadogen Arms", address: "298 King's Rd, London SW3 5UG", image: "beer.png",drink: "Old Fashion", strokes: "5" }
  ],
  "James Blunt" => [
    { name: "The Fox and the Pheasant", address: "1 Billing Rd, London SW10 9UJ", image: "beer.png", drink: "Guinness", strokes: "2" },
    { name: "Hollywood Arms", address: "45 Hollywood Rd, London SW10 9HX", image: "beer.png", drink: "Vodka Lime and Soda", strokes: "3" },
    { name: "Maggies Club", address: "329 Fulham Rd, London SW10 9QL", image: "beer.png", drink: "Tequila", strokes: "1" }
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


