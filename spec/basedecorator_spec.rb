require_relative '../basedecorator'

describe BaseDecorator do
  before :each do
    @dummy_object = double('Nameable', correct_name: 'Original Name')
    @base_decorator = BaseDecorator.new(@dummy_object)
  end

  it 'should return- an instance of BaseDecorator' do
    expect(@base_decorator).to be_an_instance_of(BaseDecorator)
  end

  it 'should return the correct_name from the decorator object' do
    expect(@base_decorator.correct_name).to eql('Original Name')
  end
end
