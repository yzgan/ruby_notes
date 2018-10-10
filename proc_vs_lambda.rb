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
