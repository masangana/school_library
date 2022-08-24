require_relative './person'

class Student < Person
  attr_reader :classroom
  attr_accessor :type

  def initialize(classroom, age, name = 'Unknown', parent_permission = 'true', type = 'student')
    super(age, name, parent_permission)
    @classroom = classroom
    @type = type
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student << self unless classroom.student.include?(self)
  end
end
