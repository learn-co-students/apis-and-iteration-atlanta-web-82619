#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user
show_character_movies(character)

require "tty-prompt"
require "colorize"

prompt = TTY::Prompt.new

# sentence = "This is a colorized sentence"
# puts sentence.colorize(:color => :magenta, :background => :black)

# prompt.yes?('Do you like Ruby?')
# prompt.mask("What is your secret?")

# prompt.select("Choose your destiny?", %w(Scorpion Kano Jax))

# def choose_drink
#     choices = %w(vodka beer wine whisky bourbon)
#     prompt.multi_select("Select drinks?", choices)
#     if choices == bourbon
#         puts "I love bourbon too"
#     else
#         puts "I guess that's fine"
#     end
# end

# choices = [
#   { key: 'y', name: 'overwrite this file', value: :yes },
#   { key: 'n', name: 'do not overwrite this file', value: :no },
#   { key: 'a', name: 'overwrite this file and all later files', value: :all },
#   { key: 'd', name: 'show diff', value: :diff },
#   { key: 'q', name: 'quit; do not overwrite this file ', value: :quit }
# ]
# prompt.expand('Overwrite Gemfile?', choices)

result = prompt.collect do
    name = key(:name).ask('Name?')
  
    age = key(:age).ask('Age?', convert: :int)
  
    adress = key(:address) do
      (:street).ask('Street?', required: true)
      street = key(:street).ask('Street?', required: true)
      city = key(:city).ask('City?')
      zip = key(:zip).ask('Zip?', validate: /\A\d{3}\Z/)
    end
    puts "Your name is #{name} and you are #{age} years old and you live at #{street} #{city} #{zip}"
  end


