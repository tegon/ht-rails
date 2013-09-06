require_relative "challenge"

challenge "Create a hash with the keys :name and :age" do
  hash = _

  expect { hash.keys == [:name, :age] }
end

challenge "Add a new hash item named :skills, which points to an",
          "an array with the items :ruby, :rails, and :javascript" do
  hash = {}
  _

  expect { hash[:skills] == [:ruby, :rails, :javascript] }
end

challenge "Set the `name` variable to the hash value identified by the 'name' key" do
  hash = {"name" => "John Doe"}
  _

  expect { name == "John Doe" }
end

challenge "What's the returned value for a missing key?" do
  hash = {"name" => "John Doe"}

  expect { hash[:name] == _ }
end

challenge "Merge two hashes, keeping the original hash intact" do
  original = {:name => "John Doe"}
  extension = {:age => 32}
  _

  expect { merged == {:name => "John Doe", :age => 32} }
  expect { original == {:name => "John Doe"} }
end

challenge "Remove the value identified by the :useless key" do
  hash = {:useless => true, :keep_this => true}
  _

  expect { hash == {:keep_this => true} }
end

challenge "Override the hash's default value" do
  hash = _

  expect { hash[rand] == "default value" }
  expect { hash.empty? }
end


challenge "Override the hash's default value and set the value",
          "to its key when accessed for the first time" do
  hash = _
  key = rand

  expect { hash[key] == "default value" }
  expect { hash.key?(key) }
end

challenge "How many elements does this hash have?" do
  hash = {:a => 1, :b => 2}
  size = _

  expect { size == 2 }
end

challenge "A method that detect if a hash has no items" do
  hash = {}

  expect { hash._ }
end

challenge "A method that detect if a hash is populated" do
  hash = {:a => 1}

  expect { hash._ }
end

challenge "Return a new array containing only the :a and :c keys" do
  hash = {:a => 1, :b => 2, :c => 3}
  filtered = hash._

  expect { filtered == {:a => 1, :c => 3} }
end

challenge "Modify the hash to keep only the :c key" do
  hash = {:a => 1, :b => 2, :c => 3}
  hash._!

  expect { hash == {:c => 3} }
end

challenge "Detect if a value is present" do
  hash = {:a => 1}

  expect { hash._? }
end

challenge "Detect if a key is present" do
  hash = {:a => 1}

  expect { hash._? }
end

challenge "Retrieve the key for a given value" do
  hash = {:a => 1}
  key = hash._

  expect { key == :a }
end
