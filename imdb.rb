require 'imdb'
require 'pry'

class Movies_imdb
  attr_reader(:title, :rating)
  def initialize (title, rating)
    @title = title
    @rating = rating
  end
end

class Paint_grid
  def self.paint_grid (movies)
    fila = 10
    while fila > 0
      movies.each do |movie|
        if movie.rating >= fila
          print "|#"
        else
          print "| "
        end
      end
      print "|"
      puts " "
      fila -= 1
    end
  end
end

class Paint_movies
  def self.paint (movies)
    movies.each_with_index do |movie, index|
        puts "#{index +1}. #{movie}"
    end
  end
end

# class Start
#   attr_accessor :movies, :movies_array, :movies_array_imdb
#   def initialize
#     @movies = IO.read("movies.txt")
#     @movies_array = movies.split("\n")
#     @@movies_array_imdb = []
#   end
# end
#
# Start.new
movies = IO.read("movies.txt")
movies_array = movies.split("\n")
movies_array_imdb = []


movies_array.each do |movie|
    rating_movie = Imdb::Search.new(movie).movies.first.rating
    movies_array_imdb.push(Movies_imdb.new(movie,rating_movie.round))
end

Paint_grid.paint_grid(movies_array_imdb)
Paint_movies.paint(movies_array)
