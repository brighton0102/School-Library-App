require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'person'
require 'json'

class InputHandler
  def self.request_person_type
    print "\nDo you want to add a student (1) or a teacher (2)? [Insert the number]: "
    gets.chomp.strip.to_i
  end

  def self.request_age
    print 'Age: '
    gets.chomp.to_i
  end

  def self.request_name
    print 'Name: '
    gets.chomp
  end

  def self.request_permission
    print 'Has Parent Permission [Y/N]: '
    gets.chomp.downcase == 'y'
  end

  def self.request_teacher_specialization
    print 'Specialization: '
    gets.chomp
  end

  def self.request_book_name
    print "\nBook: "
    gets.chomp
  end

  def self.request_author_name
    print 'Author: '
    gets.chomp
  end

  def self.request_rental_date
    print 'Enter Rental Date (yyyy-mm-dd): '
    gets.chomp
  end

  def self.request_person_index(persons)
    print "Select a person from the following list by number (not ID)\n"
    persons.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name} ID: #{person.id} Age: #{person.age}"
    end
    gets.chomp.to_i
  end

  def self.request_book_index(books)
    puts "\nSelect a book from the following list by number"
    books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    gets.chomp.to_i
  end
end

class App
  attr_accessor :books, :person, :rentals

  def initialize(books_data, person_data, rental_data)
    @books = books_data
    @persons = person_data
    @rentals = rental_data
  end

  def list_all_books
    puts "\nList of Books. \n"
    @books.each(&:print)
  end
  puts "\n"

  def list_all_people
    puts "\n"

    @persons.each(&:print)
    puts "\n"
  end

  def list_all_rentals
    person_index = InputHandler.request_person_index(@persons)
    person = @persons[person_index]
    rentals = @rentals.select { |r| r.person == person }

    puts 'Rentals'
    rentals.each(&:print)
    puts "\n"
  end

  def create_a_person
    person_type = InputHandler.request_person_type
    age = InputHandler.request_age
    name = InputHandler.request_name

    case person_type
    when 1
      permission = InputHandler.request_permission
      create_student(age, name, permission)
    when 2
      specialization = InputHandler.request_teacher_specialization
      create_teacher(age, name, specialization)
    end
    puts "Person added Successfully. \n"
    $stdout.flush
  end

  def create_student(age, name, permission)
    @persons << Student.new(age, parent_permission: permission, name:
    name)
  end

  def create_teacher(age, name, specialization)
    @persons << Teacher.new(age, specialization, name: name)
  end

  def add_new_book
    book_name = InputHandler.request_book_name
    author_name = InputHandler.request_author_name
    @books << Book.new(book_name, author_name)
    puts "Book added successfully.\n"
    $stdout.flush
  end

  def add_rental
    book_index = InputHandler.request_book_index(@books)
    select_book = @books[book_index]
    person_index = InputHandler.request_person_index(@persons)
    select_person = @persons[person_index]
    date = InputHandler.request_rental_date
    @rentals.push(Rental.new(date, select_person, select_book))
    puts "rental added successfully.\n"
    $stdout.flush
  end

  def store_books
    data = @books.map do |book|
      { title: book.title, author: book.author, rentals: book.rentals }
    end
    file = File.open('data/books.json', 'w')
    file.puts(data.to_json)
    file.close
  end

  def store_persons
    data = @persons.map do |person|
      if person.instance_of? Student
        { name: person.name, age: person.age, type: 'Student', parent_permission: person.parent_permission }
      else
        { name: person.name, age: person.age, type: 'Teacher', specialization: person.specialization }
      end
    end
    file = File.open('data/persons.json', 'w')
    file.puts(data.to_json)
    file.close
  end

  def store_rental
    data = @rentals.map do |rental|
      {
        date: rental.date,
        person_index: @persons.find_index(rental.person),
        book_index: @books.find_index(rental.book)
      }
    end
    file = File.open('data/rentals.json', 'w')
    file.puts(data.to_json)
    file.close
  end

  def store_data
    store_books
    store_persons
    store_rental
  end
end
