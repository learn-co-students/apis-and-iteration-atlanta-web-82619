require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  character_name = character_name.split.map {|c| c.capitalize}.join(" ")
  film_urls = response_hash["results"].select {|result| result["name"] == character_name}.map {|c| c["films"]}.flatten
  film_info = film_urls.map {|url| JSON.parse(RestClient.get(url))}
  # binding.pry
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each {|film| p "#{film["title"]}"}
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end