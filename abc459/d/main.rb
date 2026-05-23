#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"


# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

T = STDIN.gets.chomp.to_i
# Q = STDIN.gets.chomp.to_i
# N, Q = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end



def calc(s)
  pq = AcLibraryRb::PriorityQueue.new {|(c1, n1), (c2, n2)| n1 > n2 }

  cs = {}
  s.chars.each do |c|
    cs[c] ||= 0
    cs[c] += 1
  end
  cs.each do |c, n|
    pq << [c, n]
  end

  l = s.length
  last_c = nil
  rs = []
  l.times do
    c, n = pq.pop
    return false if n == 0

    if c == last_c
      c2, n2 = pq.pop
      return false unless c2
      return false unless n2
      return false if n2 == 0

      pq << [c2, n2 - 1]
      rs << c2
      last_c = c2
      pq << [c, n]
    else
      pq << [c, n - 1]
      rs << c
      last_c = c
    end
  end

  rs.join('')
end


T.times do |t|
  s = STDIN.gets.chomp
  r = calc(s)
  if r
    puts 'Yes'
    puts r
  else
    puts 'No'
  end
end

