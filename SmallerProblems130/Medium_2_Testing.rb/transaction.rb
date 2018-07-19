# transaction.rb

class Transaction
  attr_reader :item_cost
  attr_accessor :amount_paid

  def initialize(item_cost)
    @item_cost = item_cost
    @amount_paid = 0
  end



  def prompt_for_payment(input: $stdin, output: $stdout)
  loop do
    output.puts "You owe $#{item_cost}.\nHow much are you paying?"
    @amount_paid = input.gets.chomp.to_f
    break if valid_payment? && sufficient_payment?
    output.puts 'That is not the correct amount. ' \
         'Please make sure to pay the full cost.'
  end
end


  private

  def valid_payment?
    amount_paid > 0.0
  end

  def sufficient_payment?
    amount_paid >= item_cost
  end
end

=begin

original method for payment prompt, it was changed for ease of testing
to what is now in the code above, per this exercise
(https://launchschool.com/exercises/64799839)

def prompt_for_payment
    loop do
      puts "You owe $#{item_cost}.\nHow much are you paying?"
      @amount_paid = gets.chomp.to_f
      break if valid_payment? && sufficient_payment?
      puts 'That is not the correct amount. ' \
           'Please make sure to pay the full cost.'
    end
  end

  -----
  here is the 2nd prompt_for_payment method we discarded for the one currently
  in place, in order to allow for removing some output for the test for thie 
  instance method(see https://launchschool.com/exercises/e2b66911):

    def prompt_for_payment(input: $stdin) # We've set a default parameter for stdin
    loop do
      puts "You owe $#{item_cost}.\nHow much are you paying?"
      @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
      break if valid_payment? && sufficient_payment?
      puts 'That is not the correct amount. ' \
           'Please make sure to pay the full cost.'
    end
  end

=end