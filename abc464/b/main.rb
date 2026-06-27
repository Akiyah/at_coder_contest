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

H, W = STDIN.gets.chomp.split.map(&:to_i)
CS = (1..H).map do
  STDIN.gets.chomp.chars
end


def remove(cs)

  pp(cs:) if $debug

  height = cs.length
  width = cs[0].length

  w0 = nil
  w1 = nil
  (0...width).each do |w|
    b = (0...height).all? { |h| cs[h][w] == '.' }
    unless b
      break
    end
    w0 = w
  end
  (0...width).each do |w|
    b = (0...height).all? { |h| cs[h][-w] == '.' }
    unless b
      break
    end
    w1 = width - w
  end

  if w0 && w1
    cs = cs.map { |line| line[(w0 + 1)...w1]}
  elsif w0
    cs = cs.map { |line| line[(w0 + 1)...]}
  elsif w1
    cs = cs.map { |line| line[...w1]}
  else
  end

  pp(w0:, w1:) if $debug

  pp(cs:) if $debug

  h0 = nil
  h1 = nil
  (0...height).each do |h|
    b = cs[h].all? { |c| c == '.' }
    unless b
      break
    end
    h0 = h
  end
  (0...height).each do |h|
    b = cs[-h].all? { |c| c == '.' }
    unless b
      break
    end
    h1 = height - h
  end

  if h0 && h1
    cs = cs[(h0 + 1)...h1]
  elsif h0
    cs = cs[(h0 + 1)...]
  elsif h1
    cs = cs[...h1]
  else
  end

  pp(h0:, h1:) if $debug
  pp(cs:) if $debug

  cs
end

cs2 = remove(CS)

cs2.each do |line|
  puts line.join('')
end


