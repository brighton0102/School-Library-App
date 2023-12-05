class Student < Person
  def initialize(classroom:, name: 'Unknown', age: 0, parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  attr_accessor :classroom


  def play_hooky
    '¯\\(ツ)/¯'
  end
end
