status = 'fail' # pending | complete | fail

if status == 'pending'
  puts 'hello. this task is pending'
elsif status == 'complete'
  puts 'hello. this task is complete'
else
  puts 'hello. ffffuuuu'
end

case status
when nil, 'pending'
  puts 'is pending'
when 'complete'
  puts 'is complete'
else
  puts 'fffuuuu'
end