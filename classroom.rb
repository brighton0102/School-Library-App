class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = [] # Fix the variable name to be plural
  end

  def add_student(student)
    students << student
    student.classroom = self
  end
end
