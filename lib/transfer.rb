class Transfer
 attr_accessor :sender, :receiver, :amount, :status, :count
    
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    @receiver.valid? && @sender.valid?
  end
  
  def execute_transaction
    if @sender.balance > @amount
      @balance= @balance-amount
      @status == "completed"
    else
      @status == "rejected"
       return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount )
      @receiver.deposit( @amount*-1 )
    else
      @status = "reversed"
    end
  end
  
end
