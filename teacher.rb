class Teacher < Person
  def initialize(specialization:, name: 'Unknown', age: 0, parent_permission: true)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  attr_accessor :specialization

  def can_use_services?
    true
  end
end
