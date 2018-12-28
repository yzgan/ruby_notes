# for ruby 2.5 above
# The primary purpose of this method is to “tap into” a method chain,
# in order to perform operations on intermediate results within the chain.

(1..10)                   .tap { |x| puts "original: #{x}" }
  .to_a                   .tap { |x| puts "array:    #{x}" }
  .select { |x| x.even? } .tap { |x| puts "evens:    #{x}" }
  .map { |x| x*x }        .tap { |x| puts "squares:  #{x}" }

User = Struct.new(:name, :sex) do
  def male?
    sex == "male"
  end
end

user = User.new("Bogdan", "male")
puts '==== tap ===='
user
  .tap { |u| puts u.name }
  .tap { |u| u.male? ? "Mr. #{u.name}" : "Ms. #{u.name}" } # => "Mr. Bogdan"
  .tap { |u| "Hi, #{u.name.upcase!}" } # => "Hi, BOGDAN"
  .tap { |u| puts u.name }
puts '==== yield self ===='
user.yield_self { |u| puts u.name }
user.yield_self { |u| u.male? ? "Mr. #{u.name}" : "Ms. #{u.name}" } # => "Mr. Bogdan"
user.yield_self { |u| "Hi, #{u.name.upcase!}" } # => "Hi, BOGDAN"
user.yield_self { |u| puts u.name }
