string = "Hello"
string += "World"

string = "Hello" + "World"

string = "Hello"
string << "World" # shovel = pá!

puts string

class Logger
  def initialize(storage)
    @storage = storage
    @logs = []
  end

  def <<(message)
    @storage << message
  end
end

storage = File.open("./sample.log", "a+")
logger = Logger.new(storage)
logger << "Hello"
logger << "World"

storage.close
p File.read("./sample.log")