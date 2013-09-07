class User
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    self.first_name = first_name
    self.last_name = last_name
  end

  def full_name
    "#{ first_name } #{ last_name }"
  end

  def first_name=(first_name)
    @first_name = first_name.upcase
  end

  def last_name=(last_name)
    @last_name = last_name.upcase
  end
end

user = User.new("John", "Doe")
puts user.first_name
puts user.last_name
puts user.full_name