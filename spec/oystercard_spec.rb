require 'oystercard'
describe Oystercard do

  it 'should test that oystercard is initialized with a balance of 0' do
    expect(subject.balance).to eq 0
  end

  it 'should top up value of oyster card with given value' do
    subject.top_up(30)
    expect(subject.balance).to eq 30
  end

  it 'should raise an error if maximun balance is exceeded' do
    expect{subject.top_up(95)}.to raise_error "Maximum balance limit of £90 exceeded"
  end

  it 'should be able to deduct a given value from the balance' do
    subject.top_up(40)
    subject.deduct(30)
    expect(subject.balance).to eq 10
  end

end
