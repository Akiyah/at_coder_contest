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

N, Q = STDIN.gets.chomp.split.map(&:to_i)
CPS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


cards = []
cards = N.times.map do |i|
  { no: i, parent: i, child: nil }
end

CPS.each do |c, p|

  card_c = cards[c - 1]
  card_p = cards[p - 1]

  card_c[:parent] = card_p
  card_p[:child] = card_c
end

pp(cards:) if $debug

rs = Array.new(N, 0)
N.times do |i|
  card = cards[i]
  pp(i:, card:) if $debug
  next unless card[:parent].kind_of?(Integer)

  p = card[:parent]
  pp(p:) if $debug

  r = 0
  while card
    r += 1
    child_card = card[:child]
    break if !child_card || child_card[:parent][:no] != card[:no]
    card = child_card
  end
  rs[p] = r
end



pp(rs:) if $debug

puts rs.join(' ')