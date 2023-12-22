require_relative '../classroom'
require_relative '../student'

RSpec.describe Classroom do
  before :each do
    @classroom = Classroom.new('Backend')
  end

  describe '#new' do
    it 'should be instance of Classroom' do
      expect(@classroom).to be_an_instance_of(Classroom)
    end
  end

  describe '#label' do
    it 'should be Backend' do
      expect(@classroom.label).to eql('Backend')
    end
  end

  describe '#students' do
    it 'should be 2 student inside' do
      ichsan = Student.new(12, parent_permission: true, name: 'Ichsan')
      kamran = Student.new(12, parent_permission: true, name: 'Kamran')
      @classroom.add_student(ichsan)
      @classroom.add_student(kamran)
      expect(@classroom.students.length).to eql(2)
    end
  end
end
