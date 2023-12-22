require_relative '../rental'

RSpec.describe Rental do
  # Create test doubles for 'Person' and 'Book' objects

  let(:person) { instance_double('Person', rentals: []) }
  let(:book) { instance_double('Book', title: 'Sample Book', rentals: []) }

  before :each do
    @rental = Rental.new('2023-09-07', person, book)
  end

  describe '#new' do
    it 'should be an instance of Rental' do
      expect(@rental).to be_an_instance_of(Rental)
    end

    it 'should have the correct attributes' do
      expect(@rental.date).to eql('2023-09-07')
      expect(@rental.person).to eql(person)
      expect(@rental.book).to eql(book)
    end

    it "should add itself to person's rentals" do
      expect(person.rentals).to include(@rental)
    end

    it "should add itself to book's rentals" do
      expect(book.rentals).to include(@rental)
    end
  end

  describe '#print' do
    it 'should print the rental details' do
      expect { @rental.print }.to output("Date: 2023-09-07, Book: Sample Book\n").to_stdout
    end
  end
end
