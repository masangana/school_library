require_relative '../book'
require_relative '../person'

describe 'Person object' do
  context 'should create an instance of Person class' do
    person = Person.new(26, 'Mike', parent_permission: false)

    it 'takes three parameters and returns a Person object' do
      expect(person.class) == Person
    end

    it 'returns correct age, name and parent_permission data from of person object' do
      expect(person.name).to eq 'Mike'
      expect(person.age).to eq 26
      expect(person.parent_permission) == false

      expect(person.name).not_to eq 'Ruth'
      expect(person.age).not_to eq 30      
    end

    it 'checks the availability of Person class method/s' do
      # checks if add_rental functions exist or not
      expect(Person.instance_methods(false).include?(:add_rental)).to eq true
    end
  end
end