class classroom
    attr_accessor :lable, :students

    def initialize(lable)
        @lable = lable
        @students = []
    end

    def add_student(student)
        @student << student
        student.classroom = self
    end

end