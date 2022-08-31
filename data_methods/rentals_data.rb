require 'json'
require './rental'

module RentalsData
  def save_rentals(rentals)
    data = rentals.map do |rental|
      { date: rental.date, book: rental.book.title, person_id: rental.person.id }
    end

    File.write('./data/rental.json', JSON.pretty_generate(data))
  end

  def find_book(books, title)
    books.each { |book| return book if book.title == title }
  end

  def find_person(people, id)
    people.each { |person| return person if person.id == id }
  end

  def retrieve_rentals(books, people)
    data = []
    file = './data/rental.json'

    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |rental|
        data << Rental.new(rental['date'], find_book(books, rental['book']), find_person(people, rental['person_id']))
      end
    end

    data
  end
end
