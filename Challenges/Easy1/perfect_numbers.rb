
# https://launchschool.com/exercises/0875e53f


class PerfectNumber
  def self.classify(num)
    raise RuntimeError, 'Number must be positive' unless num > 0

    multiples_sum =
    (1...num).select { |i| num % i == 0 }.reduce(&:+)

    case 
    when multiples_sum > num then 'abundant' 
    when multiples_sum < num then 'deficient' 
    when multiples_sum == num then 'perfect' 
    end
  end
end


=begin

Understand the problem: 
  From test cases file:
- negativen numbers trigger RunTime Error

Set up your test cases: given

Describe your inputs, outputs, and data structures:
-------------------
Inputs: integer

Outputs: string -> 'deficient', 'perfect', 'abundant' based on if perfect number or not

Data structure(s): 

Describe your algorithm: from 1 up to but not including number, find any number
that has 0 remainder when divided into number, if so it is a multiple. gather all the
multiples and sum them up.  compare that sum to the number itself and based upon that
return the outputs specified above(is it Perfect or not

Begin Coding

=end