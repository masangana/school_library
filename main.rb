require_relative './app'

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

def choose_action(app)
  choice = gets.chomp
  case choice
  when '1'
    app.display_books
  when '2'
    app.display_people
  when '3'
    app.create_person
  when '4'
    app.create_book
  when '5'
    app.create_rental
  when '6'
    app.display_rental
  else
    exit_app
  end
end

def exit_app
  puts 'Thank you for using this app! Now exiting...'
  exit
end

main
