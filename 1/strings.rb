name = "John Doe"
other_name = "Jane"

string = "Hi, #{name}!"
puts string

string = 'Hi, #{name}!'
puts string

string = "Hi, %s! I'm %s.\n"
printf(string, name, other_name)
puts sprintf(string, name, other_name)
puts sprintf("%.2f => %d", 1234, 1234.56)
puts string % [name, other_name] 

string = "Hi, %{visitor}. My name is %{host}."
puts string % {:visitor => "John", :host => "Jane"}