require_relative 'app'

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
  app = App.new

  loop do
    render_choices
    choice = gets.chomp.to_i
    if choice >= 7
      puts 'Thank you for using this app'
      break
    end
    choose_number(choice, app)
  end
end

main
