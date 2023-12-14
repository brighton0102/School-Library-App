class Student < Person
  attr_reader :classroom

  def initialize(classroom:, name: 'Unknown', age: 0, parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
