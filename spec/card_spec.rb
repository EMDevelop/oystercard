require 'card'
describe Oystercard do 

  context 'I want money on my card' do

    it 'checks that a new oystercard is created with a balance of 0' do
      expect(subject.balance).to eq 0
    end

  end

  context 'I want to add money to my card' do

    it 'adds money to balance' do 
      subject.top_up(10)
      expect(subject).to respond_to(:top_up).with(1).argument
      expect(subject.balance).to eq(10)
    end

  end

  context "I don't want to put too much money on my card" do
    
    it 'raises an error when the top up amount exceeds the £90 limit' do
      expect(described_class::BALANCE_LIMIT).to eq 90
      expect { subject.top_up(91) }.to raise_error "Top up amount exceeds £#{described_class::BALANCE_LIMIT}"
    end
  end

  context "I need my fare deducated from my card" do

    it 'deducts money from my balance' do
      expect(subject).to respond_to(:deduct).with(1).argument
      subject.top_up(10)
      subject.deduct(5)
      expect(subject.balance).to eq(5)
    end

  end

  context 'I need to touch in and out' do

    it 'checks that card knows it is in a journey' do
      expect(subject.in_journey).to eq false
    end

    it 'checks that card responds to touch_in' do
      expect(subject).to respond_to(:touch_in)
    end


    it 'checks that a card touches in and is registered' do
      subject.touch_in
      expect(subject.in_journey).to eq true
    end

    it 'checks that card responds to touch_out' do
      expect(subject).to respond_to(:touch_out)
    end

    it 'checks that a card touches out and is registered' do
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey).to eq false
    end
  end


end