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