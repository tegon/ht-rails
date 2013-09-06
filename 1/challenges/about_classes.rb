require_relative "challenge"

# Define your User class here
class User
  def initialize(name = "John", email = "john@test.com")

  end
end

challenge "Define a class named User and set it to the `user_class` variable" do
  user_class = User
  expect { user_class == User }
end

challenge "Initialize a new User object" do
  user = User.new
  expect { user.instance_of?(User) }
end

challenge "Initialize a new User object with two optional attributes",
          "that represents the name and email attributes" do
  user = User.new("Test", "test@domain.com")

  expect { user.instance_of?(User) }
end

challenge "Create the getters that will return the attributes",
          "passed to the initializer" do
  user = _

  expect { user.name == "John Doe" }
  expect { user.email == "john@example.org" }
end

challenge "Create the writers that will set the attributes" do
  user = User.new
  user.name = "John Doe"
  user.email = "john@example.org"

  expect { user.name == "John Doe" }
  expect { user.email == "john@example.org" }
end

challenge "Create a new attribute called role" do
  user = User.new
  user.role = "admin"

  expect { user.role == "admin" }
end

challenge "Create a predicate method that return true when the user's role is admin" do
  user = User.new
  user.role = "admin"

  expect { user.admin? }
end

challenge "Create a bang method that sets the user's role to admin" do
  user = User.new
  user.admin!

  expect { user.admin? }
end

challenge "Create a Admin class that inherits from the User class and",
          "set the user's role to admin by default" do
  admin = Admin.new

  expect { Admin.superclass == User }
  expect { admin.instance_of?(Admin) }
  expect { admin.admin? }
end

challenge "Raise an exception when trying to change the admin's",
          "role to something other than admin. The raised exception",
          "must be a string `Can't change admin's role attribute`." do

  expect_exception("Can't change admin's role attribute") {
    Admin.new.role = "customer"
  }
end

challenge "Raise an exception class Admin::ImmutableAttribute when trying",
          "to change the admin's role to something other than admin.",
          "Make sure your exception class inherits from StandardError." do

  expect_exception(Admin::ImmutableAttribute) {
    Admin.new.role = "customer"
  }
end
