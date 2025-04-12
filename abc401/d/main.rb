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

N, K = STDIN.gets.chomp.split.map(&:to_i)
S = STDIN.gets.chomp

cs = S.chars
cs2 = []
cs2[0] = cs[0]
cs2[N - 1] = cs[N - 1]

if cs[0] == '?' && cs[1] == 'o'
  cs2[0] = '.'
else
  cs2[0] = cs[0]
end

if cs[-1] == '?' && cs[-2] == 'o'
  cs2[-1] = '.'
else
  cs2[-1] = cs[-1]
end

(1...(N - 1)).each do |i|
  if cs[i] == '?' && cs[i - 1] == 'o' ||  cs[i + 1] == 'o'
    cs2[i] = '.'
  else
    cs2[i] = cs[i]
  end
end

pp cs if $debug
pp cs2 if $debug

vs = cs2.group_by { |c| c }.transform_values(&:length)
o_count = vs['o'] || 0

pp({vs:, o_count:}) if $debug

qs = []
q_count = 0
cs2.each do |c|
  if c == '?'
    q_count += 1
  else # c == 'o' ||  c == '.'
    qs << q_count if 0 < q_count
    q_count = 0
  end
end
qs << q_count if 0 < q_count

pp({qs:}) if $debug

use_o_count = K - o_count

x = qs.map{ |q| q % 2 == 0 ? q / 2 : 1 + (q / 2) }.sum
pp({x:}) if $debug
exist_space = (x > use_o_count)

# pp qs.map{ |q| q % 2 == 0 ? q / 2 : q / 2 }.sum
pp({use_o_count:, exist_space:}) if $debug


rs = []
last_c = nil
cs2.each do |c|
  if c == '?'
    if last_c == '?'
    else
      q = qs.shift
      if use_o_count == 0
        rs << '.' * q
      else
        if q % 2 != 0 && !exist_space
          rs << 'o.' * (q / 2) + 'o'
        else
          rs << '?' * q
        end
      end
    end
  else # c == 'o' ||  c == '.'
    rs << c
  end
  last_c = c
end

puts rs.join('')

