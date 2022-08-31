require 'json'
require './book'

module BooksData
  def save_books(books)
    data = books.map do |book|
      { title: book.title, author: book.author }
    end

    File.open("./data/books.json", "w") do |f|
      f.write(JSON.pretty_generate(data))
    end
  end

  def get_books
    data = []
    file = './data/books.json'

    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |book|
        data << Book.new(book['title'], book['author'])
      end
    end

    data
  end
end