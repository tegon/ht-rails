class Color
  # def self.color
  #   puts "showing some colors"
  # end
  def Color.color
    puts "showing some colors"
  end
end

object = Object.new
object2 = Object.new

def object.hello
  puts "Hello there!"
end

p object.singleton_methods
p Color.singleton_methods
p Color.color
object.hello

p "Color#color => #{Color.instance_methods.include?(:color)}"
p "Color.color => #{Color.methods.include?(:color)}"
# object2.hello - fail