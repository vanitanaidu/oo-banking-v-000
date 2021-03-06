class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount = amount
    end

   def valid?
    self.sender.valid? && self.receiver.valid?
  end


  def execute_transaction
    if self.valid? && self.status == "pending" && self.sender.balance > self.amount
      # binding.pry
      self.sender.balance = self.sender.balance - self.amount #sender.balance -= self.amount
      self.receiver.balance = self.receiver.balance + self.amount #sender.balance += self.amount
        self.status = "complete"

    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."

    end
  end

  def reverse_transfer
      if self.status == "complete"
        self.sender.balance = self.sender.balance + self.amount #sender.balance -= self.amount
        self.receiver.balance = self.receiver.balance - self.amount #sender.balance += self.amount
        self.status = "reversed"
      end
  end

end
