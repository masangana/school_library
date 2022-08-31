require_relative '../student'

describe 'Student object' do
  context 'should create an instance of Student class' do
    student = Student.new(101, 28, 'Mike', false)

    it 'takes four parameters and returns a Student object' do
      expect(student.class) == Student
    end

    it 'returns correct classroom, age, name and parent_permission data from student object' do
      expect(student.name).to eq 'Mike'
      expect(student.age).to eq 28
      expect(student.classroom).to eq 101
      expect(student.parent_permission).to eq false

      expect(student.name).not_to eq 'Ruth'
      expect(student.age).not_to eq 30
      expect(student.classroom).not_to eq 601
    end

    it 'checks the availability of Student class method/s' do
      expect(Student.instance_methods(false).include?(:classroom)).to eq true
    end
  end
end
