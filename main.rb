require_relative './app'

def main
    app = App.new

    loop do
        dispaly_menu
        choose_action(app)
    end
end

def dispaly_menu
    puts 'welecome to the library App!'
    puts 'What would you like to do?'
    options = [
        '1. List all book',
        '2. List all people',
        '3. Create a new person',
        '4. Create a new book',
        '5. Create a new rental',
        '6. List all rentals',
        '7. Exit'
    ]
    puts options.join("\n")
end

def choose_action(app)

    print 'Input the number of the action: '
    choice = gets.chomp.to_i
    case choice
    when 1
        app.display_books
    when 2
        app.display_people
    when 3
        app.create_person
    when 4
        app.create_book
    when 5
        app.create_rental
    when 6
        app.display_rentals
    when 7
        exit
    else
        puts 'Invalid option'
    end
end

def exit_app
    puts '\nThank you for using the library App!'
    exit
end

main if __FILE__ == $PROGRAM_NAME