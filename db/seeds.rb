# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

LOCATIONS = ["SW London", "Central London", "North London"]

Course.destroy_all
User.destroy_all

# Define Courses and their Pubs
courses = {
  "South Ken Classic" => [
    { name: "Angelsea Arms", address: "15 Selwood Terrace, South Kensington, London SW7 3QG", drink: "Lager" },
    { name: "Drayton Arms", address: "153 Old Brompton Rd, Greater, London SW5 0LJ", drink: "Gin and Tonic" },
    { name: "Nam Long", address: "159 Old Brompton Rd, London SW5 0LJ", drink: "Flaming Ferrari" }
  ],
  "The Old Course"  => [
    { name: "The Suprise, Chelsea", address: "6 Christchurch Terrace, London SW3 4AJ", drink: "Lager" },
    { name: "The Sydney Arms", address: "70 Sydney St, London SW3 6NJ", drink: "Guinness" },
    { name: "Cadogen Arms", address: "298 King's Rd, London SW3 5UG", drink: "Old Fashion" }
  ],
  "James Blunt" => [
    { name: "The Fox and the Pheasant", address: "1 Billing Rd, London SW10 9UJ", drink: "Guinness" },
    { name: "Hollywood Arms", address: "45 Hollywood Rd, London SW10 9HX", drink: "Vodka Lime and Soda" },
    { name: "Maggies Club", address: "329 Fulham Rd., London SW10 9QL", drink: "Tequila" }
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
      course: course
    )
  end
end

# Create Users
users = [
  { email: "user1@example.com", password: "password1" },
  { email: "user2@example.com", password: "password2" },
  { email: "user3@example.com", password: "password3" },
  { email: "user4@example.com", password: "password4" },
  { email: "user5@example.com", password: "pathword" },
]

User.create!(users)
