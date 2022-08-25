require_relative './teacher'
require_relative './student'
require_relative './book'
require_relative './rental'

class App 
    attr_accessor :teachers, :students, :books, :rentals, :people

    def initialize
        @people = []
        @students = []
        @books = []
        @rentals = []
        @teachers = []
    end

    def display_books
        if @books.length.zero?
            puts 'Book List is empty'
        else
            @books.each_with_index do |book, index|
                puts "(#{index}) Title: \"#{book.title}\", Author: #{book.author}"
            end
        end
    end

    def display_people
        if @people.length.zero?
            puts 'People List is empty'
        else
            @people.each_with_index do |person, index|
                puts "(#{index}), #{person.type}, Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
            end
        end
    end

    def create_person
        print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
        choice = gets.chomp

        if choice == '1'
            print 'Input the age of the student: '
            age = gets.chomp.to_i
            print 'Input the name of the student: '
            name = gets.chomp.capitalize
            print 'Has parent permission? [y/n]: '
            parent_permission = gets.chomp.downcase == 'y' ? true : false
            print 'Input the classroom of the student: '
            classroom = gets.chomp
            @students << Student.new(classroom, age, name, parent_permission)
            @people << @students.last
            print 'Student created successfully!\n"'
        elsif choice == '2'
            print 'Input the age of the teacher: '
            age_teacher = gets.chomp.to_i
            print 'Input the name of the teacher: '
            name_teacher = gets.chomp
            print 'Input the permission of the teacher: '
            permission_teacher = gets.chomp
            print 'Specialization of the teacher: '
            specialization_teacher = gets.chomp.capitalize
            #age_teacher, name: name_teacher, parent_permission: permission_teacher, specialization: specialization_teacher, type: 'Teacher'
            @teachers << Teacher.new(age_teacher, name_teacher, permission_teacher, specialization_teacher)
            @people << @teachers.last
            print 'Teacher created successfully!\n"'
        else
            puts 'Invalid input'
        end
    end

    def create_book
        print 'Input the title of the book: '
        title = gets.chomp.capitalize
        print 'Input the author of the book: '
        author = gets.chomp.capitalize
        @books << Book.new(title, author)
        puts 'Book created successfully!\n"'
    end

    def create_rental
        display_people
        print 'Input the index of the person: '
        index = gets.chomp.to_i
        display_books
        print 'Input the index of the book: '
        book_index = gets.chomp.to_i
        print 'Input the date of the rental [yyyy/mm/dd]: '
        date = gets.chomp
        #@people[index].add_rental(date, @books[book_index])
        puts @people[index]
        puts @books[book_index]
        #@rentals << Rental.new(date, @people[index], @books[book_index])
        #@rentals << @people[index].rentals.last
        puts 'Rental created successfully!\n"'
    end 

    def create_rental2
        #book_index = gets.chomp.to_i
        person_index = gets.chomp.to_i
        puts @people[person_index]
        puts @people.find_index(person_index)
    end
        
    def create_new_rental
        display_people
        print 'Input the index of the person: '
        index = gets.chomp.to_i
        display_books
        print 'Input the index of the book: '
        book_index = gets.chomp.to_i
        print 'Input the date of the rental [yyyy/mm/dd]: '
        date = gets.chomp
        @people[index].add_rental(date, @books[book_index])
        @rentals << @people[index].rentals.last
        puts 'Rental created successfully!\n"'
    end

    def create_rental33
        puts 'Select a book from the following list by number rental 3'
        display_books
        rented_book = gets.chomp.capitalize
        puts 'Select a person from the following list by number (not by id)'
        display_people
        renter = gets.chomp.capitalize
        puts 'Date [yyyy/mm/dd]: '
        date_of_rent = gets.chomp
        add_rental(date_of_rent, renter, rented_book)
        print "Rental created successfully.\n"
      end
    
      def add_rental(date_of_rent, rented_book, renter)
        new_rental = Rental.new(date_of_rent, @people[renter.to_i], @books[rented_book.to_i])
        @rental_list << new_rental
      end

    def display_rentals
        if @rentals.empty?
            puts 'Rental List is empty'
        else
            @rentals.each do |rental, index|
                puts "(#{index}) Date: #{rental.date}, Book: #{rental.book.title}, Person: #{rental.person.name}"
            end
        end
    end

    def display_rentals_by_person
        display_people
        print 'Input the index of the person: '
        index = gets.chomp.to_i
        if @people[index].rentals.empty?
            puts 'No rentals found'
        else
            @people[index].rentals.each do |rental, index|
                puts "(#{index}) Date: #{rental.date}, Book: #{rental.book.title}"
            end
        end
    end

    def display_rentals_by_book
        display_books
        print 'Input the index of the book: '
        index = gets.chomp.to_i
        if @books[index].rentals.empty?
            puts 'No rentals found'
        else
            @books[index].rentals.each do |rental, index|
                puts "(#{index}) Date: #{rental.date}, Person: #{rental.person.name}"
            end
        end
    end
end