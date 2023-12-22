require_relative '../trimmerdecorator'

describe TrimmerDecorator do
  let(:nameable) { instance_double('Nameable', correct_name: 'Jonathanuous') }
  let(:trimmer_decorator) { TrimmerDecorator.new(nameable) }

  describe '#new' do
    it 'should be an instance of TrimmerDecorator' do
      expect(trimmer_decorator).to be_an_instance_of(TrimmerDecorator)
    end

    it 'should inherit from BaseDecorator' do
      expect(trimmer_decorator).to be_a(BaseDecorator)
    end
  end

  describe '#correct_name' do
    it 'should return the correctly trimmed name' do
      allow(nameable).to receive(:correct_name).and_return('Jonathanuous')
      expect(trimmer_decorator.correct_name).to eql('Jonathanuo')
    end
  end
end
