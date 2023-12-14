require_relative 'basedecorator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    original_name = @nameable.correct_name
    original_name.capitalize
  end
end
