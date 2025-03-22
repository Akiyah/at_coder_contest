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

N, R, C = STDIN.gets.chomp.split.map(&:to_i)
SS = STDIN.gets.chomp.split('')

map = {}
person = [R, C]
fire = [0, 0]

map[fire[0]] ||= {}
map[fire[0]][fire[1]] = true

rs = []
SS.each do |s|
  if s == 'N'
    person[0] += 1
    fire[0] += 1
  elsif s == 'W'
    person[1] += 1
    fire[1] += 1
  elsif s == 'S'
    person[0] -= 1
    fire[0] -= 1
  else # s == 'E'
    person[1] -= 1
    fire[1] -= 1
  end

  map[fire[0]] ||= {}
  map[fire[0]][fire[1]] = true

  pp map if $debug

  if map[person[0]] && map[person[0]][person[1]]
    rs << 1
  else
    rs << 0
  end
end


puts rs.join('')


