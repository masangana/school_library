require_relative './person'

class Teacher < Person
  attr_accessor :specialization, :type

  def initialize(age, name = 'Unknown', parent_permission = 'true', specialization, type)
    super(age, name, parent_permission)
    @specialization = specialization
    @type = 'teacher'
  end

  def can_use_services?
    true
  end
end
