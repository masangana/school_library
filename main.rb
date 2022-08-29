require_relative './app'
require_relative 'choose_action'

def main
  app = App.new
  loop do
    display_menu
    choose_action(app)
  end
end

def display_menu
  puts "\nWelcome to School Library App!"
  puts "\nPlease choose an option by entering a number:"
  options = [
    '1 - List all books',
    '2 - List all people',
    '3 - Create a person',
    '4 - Create a book',
    '5 - Create a rental',
    '6 - List all rentals for a given person id',
    '7 - Exit'
  ]
  puts options
end

def exit_app
  puts 'Thank you for using this app! Now exiting...'
  exit
end

main
