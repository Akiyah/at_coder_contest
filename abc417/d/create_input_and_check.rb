#!/usr/bin/env ruby

10.times do |i|
  `ruby create_input.rb > test/sample-random_#{i}.in`
  result = `time ruby main.rb < test/sample-random_#{i}.in`

  # pp result.split()[-3..-1]
end

