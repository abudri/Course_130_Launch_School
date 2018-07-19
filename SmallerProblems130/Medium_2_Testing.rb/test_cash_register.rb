require 'minitest/autorun'

require_relative 'transaction'
require_relative 'cash_register'


class CashRegisterTest < Minitest::Test
  
  def test_accept_money # $500 initial cash register amount
    cash_register_ex = CashRegister.new(1000)
    transaction_item = Transaction.new(50) # $50 transaction
    transaction_item.amount_paid = 50 # instead of Transaction#prompt_for_payment, simply setting i.v. if concern, @amount_paid
    initial_amount = cash_register_ex.total_money
    cash_register_ex.accept_money(transaction_item)
    new_amount = cash_register_ex.total_money
    assert_equal(initial_amount + 50, cash_register_ex.total_money)
  end

  def test_change
    register = CashRegister.new(1000) #need register object to run CashRegister#change test
    transaction = Transaction.new(50) # need Transaction object to run CashRegister#change. 50 here is set for @item_cost in instantation step
    transaction.amount_paid = 60 # should give $10 change on $50 item, after paid amount of $60
    assert_equal(10, register.change(transaction))
  end


  def test_give_receipt
    register = CashRegister.new(1000) # need CashRegister object to run its #give_receipt instance method
    transaction = Transaction.new(50) # @item_cost is set to 50 here
    assert_output("You've paid $50.\n") { register.give_receipt(transaction) }
  end

  def test_prompt_for_payment
    transaction = Transaction.new(30) # @item_cost set to $30 here
    input = StringIO.new("30\n") # return carriage is part of input, not removed at point when exactly at input(before .chomp runs)
    transaction.prompt_for_payment(input: input)
    assert_equal(30, transaction.amount_paid)
  end

   def test_prompt_for_payment # needed to see solution for this
    # https://launchschool.com/exercises/e2b66911
    transaction = Transaction.new(30)
    input = StringIO.new('30')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal transaction.amount_paid, 30
  end
end
