#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

X = STDIN.gets.chomp

xs = X.chars.map(&:to_i)


x_min = xs.select { |x| x != 0 }.min

xs2 = []
b = false
xs.each do |x|
  if b
    xs2 << x
  else
    if x == x_min
      b = true
    else
      xs2 << x
    end
  end
end

puts ([x_min] + xs2.sort).join('')


