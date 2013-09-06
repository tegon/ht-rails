require_relative "challenge"

challenge "Create a string `Hello` using double quotes" do
  string = "Hello"
  expect { string == 'Hello' }
end

challenge "Create a string `Hello` using single quotes" do
  string = 'Hello'
  expect { string == "Hello" }
end

challenge "Create a string using single quotes with the text `Don't`" do
  string = 'Don\'t'
  expect { string == %[Don't] }
end

challenge %[Create a string using double quotes with the text `"You're right!"`] do
  string = "\"Your right!\""
  expect { string == %["Your right!"] }
end

challenge "Concat the strings 'Hello' and 'World'" do
  hello = "Hello"
  world = "World"
  full = "#{ hello } #{ world }"

  expect { full == %[Hello World] }
end

challenge "Add a new line to the end of the string" do
  string = "Hello"
  string << "\n"

  expect { string == %[Hello\n] }
end

challenge %q[Add a literal \n to the end of the string] do
  string = '\n'
  expect { string == %q[\n] }
end

challenge "Interpolate the `name` variable" do
  name = "John Doe"
  message = "Hello, #{ name }!"

  expect { message == "Hello, John Doe!" }
end

challenge "Interpolate the `name` variable" do
  name = "John Doe"
  template = "Hello, %{name}!"
  message = template % { :name => name }

  expect { message == "Hello, John Doe!" }
end

challenge "Get the character of index 1" do
  string = "Hello There!"
  char = string[1]

  expect { char == "e" }
end

challenge "Get the numeric representation of the character at index 1" do
  string = "Hello There!"
  numeric = string[1].ord

  expect { numeric == 101 }
end

challenge "Transform the string into a uppercased version" do
  string = "Hello there!"
  string.upcase!

  expect { string == "HELLO THERE!" }
end

challenge "Transform the string into a lowercased version" do
  string = "HELLO THERE!"
  string.downcase!

  expect { string == "hello there!" }
end

challenge "Return an array from the string below, using | as separator" do
  string = "1|2|3|4|5"
  array = string.split("|")

  expect { array == ["1", "2", "3", "4", "5"] }
end

challenge "Return a partial string `lo Wo` from the string" do
  string = "Hello World"
  partial = string.scan(/(lo)|(Wo)/).flatten.compact.join(" ")

  expect { partial == "lo Wo" }
end