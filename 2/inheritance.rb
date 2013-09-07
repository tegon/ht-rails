class User
  attr_accessor :role

  def initialize
    @role = :customer
  end

  def admin?
    @role == :admin
  end
end

class Admin < User
  def initialize
    super
    @role = :admin
  end
end

user = User.new
admin = Admin.new

p user.admin?
p admin.admin?

p Admin.superclass