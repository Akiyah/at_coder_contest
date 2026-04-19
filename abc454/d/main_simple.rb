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

T = STDIN.gets.chomp.to_i



def normalize(a)
  pp(name: 'normalize', a:) if $debug
  cs = a.chars

  rs = []
  cs.each do |c|
    if c == ')' && rs[-1] == 'x' && rs[-2] == 'x' && rs[-3] == '('
      rs.delete_at(-3)
    else
      rs << c
    end
  end

  rs.join('')
end


def calc(a, b)
  pp(a:, b:) if $debug
  an = normalize(a)
  bn = normalize(b)
  pp(an:, bn:) if $debug
  an == bn
end



T.times do
  a = STDIN.gets.chomp
  b = STDIN.gets.chomp
  r = calc(a, b)
  puts r ? 'Yes' : 'No'
end

