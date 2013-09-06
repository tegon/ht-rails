sum = proc do |n1 = 0, n2 = 0|
  n1 + n2 # does not have explicit return
end

sum2 = proc do |*numbers|
  numbers.reduce(:+)
end

sum3 = proc do |n1, n2, n3| # closure
  n1 + sum.call(n2, n3)
end

puts sum3.call(1, 2, 3)

puts sum.call(1, 2)
puts sum[1, 2]
# puts sum(1, 2) error
puts sum.(1, 2)

multiply = lambda do |n1, n2|
  return n1 * n2 # explicit return
end

puts sum.call
puts sum2.call(1, 10, 20)
# sum.call nil
# multiply.call wrong number of arguments
puts multiply.call(2, 3)