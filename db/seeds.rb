# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Candidate.destroy_all


@candidates = []

7.times do
  candidate = Candidate.create!(name: Faker::Name.name,
                            party: ["Same As The Old", "Lame Duck", "Piraten"].sample)
  @candidates << candidate
end
