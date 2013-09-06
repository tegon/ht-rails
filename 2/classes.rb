class User
  # attr_reader :name, :email
  # attr_writer :name, :email
  attr_accessor :name, :email

  def initialize(attrs = {})
    @name = attrs[:name]
    @email = attrs[:email]
  end

  # def name(*args)
  #   @name = args.first unless args.empty?
  #   @name
  # end

  # def name
  #   @name
  # end

  # def email
  #   @email
  # end

  # def name=(name)
  #   @name = name
  # end

  # def email=(email)
  #   @email = email
  # end

  def inspect
    "#<User: #{ @name }"
  end
end

user = User.new(name: "John Doe", email: "john@example.org")
User.new

puts user.method(:to_s).source_location

user.name = "Jane Doe"
user.email = "jane@example.org"

puts user.name
puts user.email

# user.name "John Doe"
# puts user.name

puts user.instance_variable_set("@email", "hello there!")
puts user.instance_variable_get("@email")