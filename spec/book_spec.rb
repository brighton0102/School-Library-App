require_relative '../book'

RSpec.describe Book do
  let(:book) { Book.new('Sample Book', 'John Doe') }

  describe '#new' do
    it 'should be an instance of Book' do
      expect(book).to be_an_instance_of(Book)
    end

    it 'should have the correct attributes' do
      expect(book.title).to eql('Sample Book')
      expect(book.author).to eql('John Doe')
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    let(:rental) { instance_double('Rental') }

    it 'should add a rental to the rentals array' do
      book.add_rental(rental)
      expect(book.rentals).to include(rental)
    end
  end

  describe '#print' do
    it 'should print book details' do
      expect { book.print }.to output("title: Sample Book by author : John Doe\n").to_stdout
    end
  end
end
