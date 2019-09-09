def welcome
  puts "Welcome, child."
end

def get_character_from_user
  puts "please enter a character name"
  character_name = gets.chomp.downcase
  get_character_movies_from_api(character_name)
end
