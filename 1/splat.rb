class Ffuu
  def to_a
    ["ffuu", "you"]
  end
end

ffuu = Ffuu.new

numbers = [1, 2, 3]
n1, n2, n3 = [1, 2, 3]
f, y = *ffuu# .to_a

puts n1
puts n2
puts n3

p f
p y