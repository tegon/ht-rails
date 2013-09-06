require_relative "challenge"

challenge "Make an array with 3 items" do
  array = [1, 2, 3]

  expect { array.size == 3 }
end

challenge "Add two elements to the end of the array" do
  array = []

  array << 1
  array << 2

  expect { array == [1, 2] }
end

challenge "Remove the last element from the array" do
  array = [1,2,3]
  array.pop

  expect { array == [1, 2] }
end

challenge "Remove the first element from the array" do
  array = [1,2,3]
  array.shift

  expect { array == [2, 3] }
end

challenge "Add a element to the start of the array" do
  array = [1,2,3]
  array.unshift(0)

  expect { array == [0, 1, 2, 3] }
end

challenge "Transform the nested array into a flattened one" do
  array = [[1], [2], [3, 4, 5]]
  array = array.flatten

  expect { array == [1, 2, 3, 4, 5] }
end

challenge "Map the array, returning its items multiplied by 2" do
  numbers = [1, 2, 3, 4, 5]
  numbers = numbers.map { |number| number * 2 }

  expect { numbers == [2, 4, 6, 8, 10] }
end

challenge "Iterate each array item, adding to the new_array variable" do
  array = [1,2,3]
  new_array = []

  array.each { |a| new_array << a }

  expect { new_array == [1, 2, 3] }
end

challenge "Reduce the array into a single sum of all elements" do
  array = [1, 2, 3]
  sum = array.inject { |sum, x| sum + x }

  expect { sum == 6 }
end

challenge "Reduce the array into a single sum of all elements + 10" do
  array = [1, 2, 3]
  sum = array.reduce(10) {|buffer, number| buffer + number }

  expect { sum == 16 }
end

challenge "Reverse the array" do
  array = [1, 2, 3]
  array = array.reverse

  expect { array == [3, 2, 1] }
end

challenge "What's the ending result of `array << 1`?" do
  array = []
  array << 1

  expect { array == [1] }
end

challenge "What's the ending result of `array += [1,2,3]" do
  array = [0]
  array += [1, 2, 3]

  expect { array == [0, 1, 2, 3] }
end

challenge "How to access the array's last element?" do
  array = [1, 2, 3]
  item = array.last

  expect { item == 3 }
end

challenge "How to find the element which its value is 3?" do
  array = [1, 2, 3, 4, 5]
  item = array[2]

  expect { item == 3 }
end

challenge "Return all even numbers" do
  array = [1, 2, 3, 4, 5, 6, 7]
  numbers = array.select {|number| number.even? }

  expect { numbers == [2, 4, 6] }
end

challenge "Return all odd numbers" do
  array = [1, 2, 3, 4, 5, 6, 7]
  numbers = array.reject {|number| number.even? }

  expect { numbers == [1, 3, 5, 7] }
end

challenge "Return an string like `1, 2, 3` from the array" do
  array = [1, 2, 3]
  string = array.join(", ")

  expect { string == "1, 2, 3" }
end