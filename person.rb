require_relative 'nameable'
require_relative 'capitalizedecorator'
require_relative 'trimmerdecorator'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(name: 'Unknown', age: 0, parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  def generate_id
    rand(1000..9999)
  end
end
