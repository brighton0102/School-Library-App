require_relative '../person'

RSpec.describe Person do
  let(:person) { Person.new(25, parent_permission: true, name: 'John Doe') }
  let(:book) { instance_double('Book') }

  describe '#new' do
    it 'should be an instance of Person' do
      expect(person).to be_an_instance_of(Person)
    end

    it 'should have default attributes' do
      expect(person.name).to eql('John Doe')
      expect(person.age).to eql(25)
      expect(person.parent_permission).to be true
      expect(person.rentals).to be_an_instance_of(Array)
      expect(person.rentals).to be_empty
    end

    it 'should default to "Unknown" for name if not provided' do
      default_person = Person.new(30)
      expect(default_person.name).to eql('Unknown')
    end
  end

  describe '#can_use_services?' do
    it 'should return true for an adult' do
      expect(person.can_use_services?).to be true
    end

    it 'should return true with parent permission for a minor' do
      minor = Person.new(17)
      expect(minor.can_use_services?).to be true
    end

    it 'should return false for a minor without parent permission' do
      minor = Person.new(17, parent_permission: false)
      expect(minor.can_use_services?).to be false
    end
  end

  describe '#add_rental' do
    it 'should create a new rental' do
      date = '2023-09-07'
      expect(Rental).to receive(:new).with(date, book, person)
      person.add_rental(book, date)
    end
  end

  describe '#correct_name' do
    it 'should return the correct name' do
      expect(person.correct_name).to eql('John Doe')
    end
  end
end
