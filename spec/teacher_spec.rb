require_relative '../teacher'

describe 'Teacher object' do
  context 'should create an instance of Teacher class' do
    teacher = Teacher.new('Physics', 38, 'Doctor Monkey', true)

    it 'takes four parameters and returns a Teacher object' do
      expect(teacher.class) == Teacher
    end

    it 'returns correct specialization, age, name and parent_permission data from teacher object' do
      expect(teacher.name).to eq 'Doctor Monkey'
      expect(teacher.age).to eq 38
      expect(teacher.specialization).to eq 'Physics'
      expect(teacher.parent_permission).to eq true

      expect(teacher.name).not_to eq 'None'
      expect(teacher.age).not_to eq 30
      expect(teacher.specialization).not_to eq 'Swimming'      
    end

    it 'checks the availability of Teacher class method/s' do
      expect(Teacher.instance_methods(false).include?(:can_use_services?)).to eq true
    end
  end
end