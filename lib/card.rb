class Oystercard

  BALANCE_LIMIT = 90

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

  def deduct(fare)
    @balance -= fare
    return_balance
  end

  def touch_in
    @in_journey = true
  end


  def touch_out
    @in_journey = false
  end

  private

  def exceeds_balance?
    @balance > BALANCE_LIMIT
  end

  def return_balance
    "£#{@balance}"
  end


  
end

#predicate method

#Method needs to be in_journey?

#to be_in_journey 