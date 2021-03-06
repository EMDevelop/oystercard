require 'card'
describe Oystercard do 
  let(:station) { double :station }
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

  # context "I need my fare deducated from my card" do

    # it 'deducts money from my balance' do
    #   subject.top_up(10)
    #   subject.deduct(5)
    #   expect(subject.balance).to eq(5)
    # end

  # end

  context 'I need to touch in and out' do

    it 'checks that card responds to touch_in' do
      expect(subject).to respond_to(:touch_in)
    end

    it 'checks that card responds to touch_out' do
      expect(subject).to respond_to(:touch_out)
    end

  end

  context 'I need to have the minimum amount (£1) for a single journey' do
    it 'checks that a card without any balance cannot check in' do
      expect{ subject.touch_in(station) }.to raise_error "Insufficient funds"
    end
  end

  context 'When my journey is complete, I need the correct amount deducted from my card' do
    it 'reduces the cards current balance by 1' do
      subject.top_up(2)
      subject.touch_in(station)
      expect {subject.touch_out}.to change{subject.balance}.by(-1)
    end
  end

  context 'I need to know where Ive travelled from.' do
    it 'keeps track of the entry station after touching in' do
      subject.top_up(1)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end

    it 'clears the entry station on touching out' do
      subject.top_up(1)
      subject.touch_in(station)
      subject.touch_out
      expect(subject.entry_station).to eq nil
    end
  end

end