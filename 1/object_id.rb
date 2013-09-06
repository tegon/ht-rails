def hello(message)
  puts message.object_id
  message.upcase!
  puts message
end


number = 1234
string = "hello"

puts false.object_id
puts true.object_id
puts nil.object_id

puts 1234.object_id
puts 1234.object_id

puts string.object_id
string = "hello " + "world"
puts string.object_id

string = "hello"
puts string.object_id
string << "hello " << "world"
puts string.object_id

hello string