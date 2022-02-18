# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'
# puts "starterd"
# List.destroy_all
# Movie.destroy_all
# Bookmark.destroy_all

# def create_1
#   begin
#     List.create!(name: Faker::Book.genre)
#     Movie.create!(title: Faker::Movie.title, overview: Faker::Restaurant.description, poster_url: 'https://source.unsplash.com/random/900×700/?movie', rating: rand(0.0..1.0))
#   rescue ActiveRecord::RecordInvalid => invalid
#     puts invalid.record.errors
#     # create
#   end
# end

# def create_2
#   begin
#     Bookmark.create!(comment: Faker::Food.ethnic_category, movie: Movie.all.sample, list: List.all.sample)
#   rescue ActiveRecord::RecordInvalid => invalid
#     puts invalid.record.errors
#     # create
#   end
# end

# 20.times{create_1}
# 40.times{create_2}


# puts "done"

require 'open-uri'

puts 'Deleting db....'
Movie.destroy_all

puts 'Creating movies....'

url = 'http://tmdb.lewagon.com/movie/top_rated'
json = URI.open(url).read
movies = JSON.parse(json)
movies['results'].each do |movie|
  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end
