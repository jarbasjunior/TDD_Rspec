class Account
  attr_accessor :balance, :message

  def initialize(balance)
    self.balance = balance
  end

  def withdraw(value, max, rate)
    if value > balance
      self.message = 'Insufficient balance for withdraw'
    elsif value > max
      self.message = "Withdrawal limit is R$ #{max}"
    else
      self.balance -= value + rate
    end
  end
end

class CheckingAccount < Account
  def withdraw(value, max = 700, rate = 2.00)
    super
  end
end

class SavingsAccount < Account
  def withdraw(value, max = 500, rate = 1.00)
    super
  end
end
