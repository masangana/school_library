require 'json'
require './student'
require './teacher'

module PeopleData
  def save_people(people)
    data = people.map do |person|
      if person.instance_of?(Student)
        { id: person.id, name: person.name, age: person.age,
          parent_permission: person.parent_permission,
          classroom: person.classroom, type: person.type }
      else
        { id: person.id, name: person.name, age: person.age,
          parent_permission: person.parent_permission,
          specialization: person.specialization, type: person.type }
      end
    end

    File.open("./data/people.json", "w") do |f|
      f.write(JSON.pretty_generate(data))
    end
  end

  def get_people
    data = []
    file = './data/people.json'
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |person|
        if person['type'] == 'Student'
          student = Student.new(person['classroom'], person['age'],
                                person['name'], person['parent_permission'])
          student.id = person['id']
          data << student
        else
          teacher = Teacher.new(person['specialization'], person['age'],
                                person['name'], person['parent_permission'])
          teacher.id = person['id']
          data << teacher
        end
      end
    end
    data
  end
end