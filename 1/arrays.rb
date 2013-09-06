oses = ["linux", "mac os x", "windows"]

# for os in oses
#   puts os
# end
# puts os # last value

oses.each do |os|
  puts os
end

oses.each_with_index do |os, i|
  puts "#{i} => #{os}"
end

map = oses.each_with_index.map do |os,i| 
  "#{os} => #{i + 1}"
end

p map

p "hello".each_char.to_a

p oses.each.to_a

# ========================

names = ["John", "Jane"]
skills = ["Ruby", "Python"]

p [names, skills].transpose

# ========================

items = []

items << 1
items.push(2)
items[items.size] = 3
p items

p items.pop
p items

p items.shift
p items

p items.unshift(0)

p items.include?(2)
p items.any?
p items.empty?
p items.size.zero?
p items.size.nonzero?
p [1,2,3].select {|n| n.even?}
p [1,2,3].reject {|n| n.even?}
p [1, [2, [3,4]]].flatten
p [1, nil, false, 2].compact