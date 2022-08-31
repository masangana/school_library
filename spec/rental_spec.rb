require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe 'Unit test for object' do
  before(:each) do
    @person = Person.new(1, 'John', 'true')
    @book = Book.new('His Dark materials', 'Philip Pullman')
    @rental = Rental.new('2020 / 1 / 1', @book, @person)
  end

  context 'should create an instance of rental class' do
    it 'takes three parameters and returns a Rental object' do
      expect(@rental.class) == Rental
    end
  end

  context 'Rental attribu' do
    it 'returns correct names of rental object instance variables' do
      expect(@rental.date).to eq '2020 / 1 / 1'
      expect(@rental.book).to eq @book
      expect(@rental.person).to eq @person
    end
  end
end
