# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts "starterd"
def create
  l = List.create!(name: Faker::Book.genre)
  m = Movie.create!(title: Faker::Movie.title, overview: Faker::Restaurant.description, poster_url: 'https://source.unsplash.com/random/900×700/?movie', rating: rand(0.0..1.0))
  Bookmark.create!(comment: Faker::Food.ethnic_category, movie: m, list: l)

end

14.times do
  # begin

  # rescue TypeError
  # end

  begin
    create
  rescue ActiveRecord::RecordInvalid => invalid
    puts invalid.record.errors
  end
end


puts "done"
