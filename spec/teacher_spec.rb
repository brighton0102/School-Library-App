require_relative '../teacher'

RSpec.describe Teacher do
  before :each do
    @teacher = Teacher.new(12, 'Backend Engineer', parent_permission: true, name: 'Ichsan')
  end

  describe '#new' do
    it 'should be instance of Teacher' do
      expect(@teacher).to be_instance_of(Teacher)
    end
  end

  describe '#age' do
    it 'should be 12' do
      expect(@teacher.age).to eql(12)
    end
  end

  describe '#specialization' do
    it 'should be Backend Engineer' do
      expect(@teacher.specialization).to eql('Backend Engineer')
    end
  end

  describe '#parent_permission' do
    it 'should be true' do
      expect(@teacher.parent_permission).to eql(true)
    end
  end

  describe '#name' do
    it 'should be ichsan' do
      expect(@teacher.name).to eql('Ichsan')
    end
  end

  describe '#can_use_services?' do
    it 'should always return true for a Teacher' do
      expect(@teacher.can_use_services?).to eql(true)
    end
  end
end
