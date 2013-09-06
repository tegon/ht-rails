puts 1.class
puts 1e50.class
puts 1e50.to_i.class
puts "hello".class
puts [].class

p Fixnum.ancestors
p 1.kind_of?(Numeric)
p 1.kind_of?(Integer)
p 1.kind_of?(Fixnum)
p 1_000_000_000_000_00_000000.kind_of?(Bignum)

p 1.instance_of?(Numeric)