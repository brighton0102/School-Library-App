require_relative 'app'
require 'json'

def render_choices
  puts 'Please Choose an Option by entering a number:'
  puts '1. List all books.'
  puts '2. List all people.'
  puts '3. Create a person.'
  puts '4. Create a book.'
  puts '5. Create a rental.'
  puts '6. List all rentals for a given person id.'
  puts '7. EXIT'
end

def choose_number(choice, app)
  case choice
  when 1
    app.list_all_books
  when 2
    app.list_all_people
  when 3
    app.create_a_person
  when 4
    app.add_new_book
  when 5
    app.add_rental
  when 6
    app.list_all_rentals
  end
end

def main
  # load the data and then parse it to the app

  books = load_book_data
  persons = load_persons_data
  rentals = load_rental_data(persons, books)
  app = App.new(books, persons, rentals)
  loop do
    render_choices
    choice = gets.chomp.to_i
    if choice >= 7
      # we will save the data
      app.store_data
      puts 'Thank you for using this app'
      break
    end
    choose_number(choice, app)
  end
end

def load_book_data
  all_book = []
  if File.exist?('data/books.json') && !File.empty?('data/books.json')
    book_data = JSON.parset(File.read('data/books.json'))
    book_data.each { |b| all_book.push(Book.new(b['title'], b['author'])) }
  end
  all_book
end

def load_persons_data
  all_persons = []

  if File.exist?('data/persons.json') && !File.empty?('data/persons.json')
    all_persons_data = JSON.parse(File.read('data/persons.json'))

    all_persons = all_persons_data.map do |_persons_data|
      if person_data['type'] == 'student'
        Student.new(person_data['age'], parent_permission: person_data['parent_permission'], name: person_data['name'])
      else
        Teacher.new(person_data['age'], person_data['specialization'], name: person_data['name'])
      end
    end
  end

  all_persons
end

def load_rental_date(persons, books)
  all_rentals = []
  if File.exist?('data/rentals.json') && !File.empty?('data/rentals.json')
    all_rentals_data = JSON.parse(File.read('data/rentals.json'))
    all_rentals_data.each do |r|
      all_rentals.push(Rental.new(r['data'], persons[r['person_index']], books[r['book_index']]))
    end
  end
  all_rentals
end

main
