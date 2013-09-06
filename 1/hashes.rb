owner = Object.new

people = {
  :john => "John",
  :jane => "Jane",
  "paul" => "Paul",
  owner => "Nice"
}

# people = {
#   john: "John",
#   jane: "Jane"
# }

p people[:john]

people[:mary] = "Mary"

p people

def hello(options = {})
  puts options[:name]
  puts options[:age]
end

hello :age => 32, :name => "John Doe"

people.each do |name, value|
  puts name
  puts value
  puts '---'
end