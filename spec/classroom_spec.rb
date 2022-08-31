require_relative '../classroom'

describe 'Unit test for Classroom object' do
    before(:each) do
        @classroom = Classroom.new(1)
    end

    context 'should create an instance of Classroom class' do
        it 'takes one parameter and returns a Classroom object' do
            expect(@classroom.class) == Classroom
        end
    end

    context 'label for Classroom object' do
        it 'returns correct label for Classroom object' do
            expect(@classroom.label) == 1
        end
    end

end