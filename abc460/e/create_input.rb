#!/usr/bin/env ruby

puts 100 * 100

(1..100).each do |n|
  (2..101).each do |m|
    puts [n, m].join(' ')
  end
end


