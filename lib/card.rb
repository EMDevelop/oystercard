class Oystercard

  BALANCE_LIMIT = 90
  MINIMUM_LIMIT = 1

  def initialize(balance=0)
    @balance = balance
    @in_journey = false
  end

  attr_reader :balance, :in_journey

  def top_up(money)
    @balance += money
    raise "Top up amount exceeds £#{BALANCE_LIMIT}" if exceeds_balance?
    return_balance
  end



  def touch_in
    raise("Insufficient funds") if @balance < MINIMUM_LIMIT
    @in_journey = true
  end


  def touch_out
    @in_journey = false
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


