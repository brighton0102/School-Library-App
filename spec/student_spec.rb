require_relative '../student'
RSpec.describe Student do
  let(:student) { Student.new(15, parent_permission: true, name: 'Alice') }
  let(:classroom) { Classroom.new('Math') }

  describe '#new' do
    it 'should be an instance of Student' do
      expect(student).to be_an_instance_of(Student)
    end

    it 'should inherit from Person' do
      expect(student).to be_a(Person)
    end

    it 'should have default attributes' do
      expect(student.name).to eql('Alice')
      expect(student.age).to eql(15)
      expect(student.parent_permission).to be true
      expect(student.classroom).to be_nil
    end
  end

  describe '#classroom=' do
    it 'should set the classroom and add the student to it' do
      student.classroom = classroom
      expect(student.classroom).to eql(classroom)
      expect(classroom.students).to include(student)
    end

    it 'should not add the student again if already in the classroom' do
      student.classroom = classroom
      student.classroom = classroom
      expect(classroom.students.count(student)).to eql(1)
    end
  end

  describe '#play_hooky' do
    it 'should return the play hooky message' do
      expect(student.play_hooky).to eql('¯\\(ツ)/¯')
    end
  end

  describe '#print' do
    it 'should print student information' do
      expect { student.print }.to output("[Student] Name: Alice, ID: #{student.id}, Age: 15\n").to_stdout
    end
  end
end
