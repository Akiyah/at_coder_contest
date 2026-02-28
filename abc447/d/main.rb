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

S = STDIN.gets.chomp


# BBBAAABCBCBAACBBCAAC
# BBBAABCBAACBBCAAC
# BBBABAACBBCAAC
# BBBAABBCAAC
# BBBABAAC
# BBBAA


# BBBAAABCBCBAACBBCAAC
# BBBAAABCBCBACBAAC
# BBBAAABCBCBCAA
# BBBAABCBCAA
# BBBABCAA
# BBBAA



ss = S.chars
n = ss.length


b_counts_by_a = []
c_counts_by_b = []
ais = []
bis = []
b_count = 0
c_count = 0
ss.reverse.each.with_index do |t, i|
  if t == 'A'
    b_counts_by_a[n - i - 1] = b_count
    ais << n - i - 1
  elsif t == 'B'
    b_count += 1
    c_counts_by_b[n - i - 1] = c_count
    bis << n - i - 1
  else # t == 'C'
    c_count += 1
  end
end

pp(b_counts_by_a:) if $debug
pp(c_counts_by_b:) if $debug
pp(ais:, bis:) if $debug


r = 0
bj = 0
ais.each do |ai| # 右から
  pp(ai:, bj:, r:) if $debug

  next unless r < b_counts_by_a[ai]

  while bj < bis.length && ai < bis[bj]
    bi = bis[bj]
    if r < c_counts_by_b[bi]
      r += 1
      bj += 1
      break
    end
    bj += 1
  end
end

puts r



