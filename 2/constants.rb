puts Object.constants.sort

puts RUBY_ENGINE

puts '-------------'

puts global_variables

puts '-------------'

string = "hello"
string.match(/(he)(ll)(o)/)
puts $1
puts $2

p $~