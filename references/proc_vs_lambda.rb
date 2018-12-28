# proc vs lambda example

def proc_function
  proc = Proc.new { return 123 }
  proc.call
  return 'abc'
end

def lambda_function
  lambda = lambda { return 123 }
  lambda.call
  return 'abc'
end

puts "Proc function return: #{proc_function}"
puts "Lambda function return: #{lambda_function}"

# Proc function return: 123
# Lambda function return: abc


a = -> { 1 + 1 }
puts a
puts a.call
# => 2

a = -> (v) { v + 1 }
puts a
puts a.call(2)
# => 3

# Lambdas are strict about arguments, but Procs don’t care
my_lambda = ->(a, b)  { a + b }
my_proc   = Proc.new  { |a, b| a + b }
my_lambda.call(2)
# ArgumentError: wrong number of arguments (1 for 2)
my_proc.call(2)
# TypeError: nil can't be coerced into Fixnum