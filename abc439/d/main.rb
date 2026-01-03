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

N = STDIN.gets.chomp.to_i
AS = STDIN.gets.chomp.split.map(&:to_i)


iss = {}
jss = {}
kss = {}
AS.each.with_index do |a, l|
  if a % 7 == 0
    iss[a / 7] ||= []
    iss[a / 7] << l
  end
  if a % 5 == 0
    jss[a / 5] ||= []
    jss[a / 5] << l
  end
  if a % 3 == 0
    kss[a / 3] ||= []
    kss[a / 3] << l
  end
end

def calc(is, js, ks)
  pp(is:, js:, ks:) if $debug
  i_ = 0
  j_ = 0
  k_ = 0

  lis = is.length
  ljs = js.length
  lks = ks.length


  r = 0
  while true
    if is[i_] && (is[i_] < js[j_]) && (!ks[k_] || is[i_] < ks[k_]) # i
      pp(i_:) if $debug
      i_ += 1
    elsif ks[k_] && (ks[k_] < js[j_]) && (!is[i_] || ks[k_] < is[i_]) # k
      pp(k_:) if $debug
      k_ += 1
    else # j
      r += (i_ * k_) + ((lis - i_) * (lks - k_))
      pp(j_:, r:) if $debug
      j_ += 1
      break if j_ == ljs
    end
  end

  pp(r:) if $debug
  r
end

pp(iss:, jss:, kss:) if $debug

r = 0
indexs = iss.keys & jss.keys & kss.keys
pp(indexs:) if $debug
indexs.each do |index|
  pp(index:) if $debug

  is = iss[index]
  js = jss[index]
  ks = kss[index]

  r += calc(is, js, ks)
end

puts r

