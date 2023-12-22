require_relative '../capitalizedecorator'

describe CapitalizeDecorator do
  let(:nameable) { instance_double('Nameable', correct_name: 'ichsan') }
  let(:capitalize_decorator) { CapitalizeDecorator.new(nameable) }

  describe '#new' do
    it 'should be an instance of CapitalizeDecorator' do
      expect(capitalize_decorator).to be_an_instance_of(CapitalizeDecorator)
    end

    it 'should inherit from BaseDecorator' do
      expected(capitalize_decorator).to be_a(BaseDecorator)
    end
  end

  describe '#correct_name' do
    it 'should return the correctrly capitalized name' do
      allow(nameable).to recieve(:correct_name).and_return('ichsan')
      expect(capitalize_decorator.correct_name).to eql(Ichsan)
    end
  end
end
