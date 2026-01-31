#!/usr/bin/env ruby

100.times do |i|
  pp(i:)

  `ruby create_input.rb > input.txt`
  `ruby main.rb < input.txt > output1.txt`
  `ruby main_ac.rb < input.txt > output2.txt`

  output1 = File.read('output1.txt')
  output2 = File.read('output2.txt')

  break unless output1 == output2
end


