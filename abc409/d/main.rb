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


def calc(n, s)
  return s if n == 1

  ss = s.chars
  cps = s.codepoints

  pp(n:, s:, ss:, cps:) if $debug

  cps[...-1].each_with_index do |cp, i|
    if cps[i + 1] < cp
      pp(i:, cp:) if $debug
      j = cps[(i + 1)..].find_index { |cp2| cp < cp2 }
      pp(j:) if $debug
      if j == nil
        pp(s1: s[0...i], s2: s[(i + 1)..], s3: s[i],) if $debug
        return s[0...i] + s[(i + 1)..] + s[i]
      else
        k = i + 1 + j
        pp(s1: s[0...i], s2: s[(i + 1)...k], s3: s[i], s4: s[k..]) if $debug
        return s[0...i] + s[(i + 1)...k] + s[i] + s[k..]
      end
    end
  end

  s # 最初が辞書順最小
end




T.times do
  n = STDIN.gets.chomp.to_i
  s = STDIN.gets.chomp

  puts calc(n, s)
end

