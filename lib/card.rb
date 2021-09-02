class Oystercard

  BALANCE_LIMIT = 90
  MINIMUM_LIMIT = 1

  def initialize(balance=0)
    @balance = balance
    @entry_station = nil
  end

  attr_reader :balance, :in_journey, :entry_station

  def top_up(money)
    @balance += money
    raise "Top up amount exceeds £#{BALANCE_LIMIT}" if exceeds_balance?
    return_balance
  end



  def touch_in(station)
    @entry_station = station
    raise("Insufficient funds") if @balance < MINIMUM_LIMIT
  end


  def touch_out
    @entry_station = nil
    deduct(MINIMUM_LIMIT)
  end

  private

  def exceeds_balance?
    @balance > BALANCE_LIMIT
  end

  def return_balance
    "£#{@balance}"
  end

  def deduct(fare)
    @balance -= fare
    return_balance
  end

end


