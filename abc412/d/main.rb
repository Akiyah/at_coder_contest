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

N, M = STDIN.gets.chomp.split.map(&:to_i)
ANS = M.times.map do
  STDIN.gets.chomp.split.map(&:to_i)
end

paths = {}
ANS.each do |a, b|
  paths[a] ||= {}
  paths[a][b] = true
  paths[b] ||= {}
  paths[b][a] = true
end



def calc_one_2(us, paths)
  pp(method: 'calc_one_2', us:) if $debug
  u0 = us[0]
  r = 0 # 追加が必要な数
  t = 0
  us[1..].each do |u|
    if paths[u0] && paths[u0][u] # 道がある
      t += 1
    else
      r += 1
    end
    u0 = u
  end

  if paths[u0] && paths[u0][us[0]] # 道がある
    t += 1
  else
    r += 1
  end

  pp(r:, t:) if $debug
  [r, t] # 追加が必要な数、もともとあった数
end

def calc_one(us, paths)
  pp(method: 'calc_one', us:) if $debug
  n = us.length
  rts = []

  # 分割しない場合
  r, t = calc_one_2(us, paths)
  rts << [r, t]

  if 6 <= n
    # 分割する場合
    (2...(n - 3)).each do |i|
      r0, t0 = calc_one_2(us[..i], paths)
      r1, t1 = calc_one(us[(i + 1)..], paths) # 更に分割の可能性あり
      rts << [r0 + r1, t0 + t1]
    end
  end

  pp(rts:) if $debug
  rts.min { |(r0, t0), (r1, t1)| (r0 - t0) <=> (r1 - t1)  }
end

def calc(paths)
  # スタート地点を1とする
  rs = []
  (2..N).to_a.permutation do |us|
    r, t = calc_one([1] + us, paths)
    pp(us:, r:, t:) if $debug
    # pp(us:, r:, rs:) if $debug
    # r = rts.map { |r, t| r + (M - t) }.min
    rs << r + (M - t)
  end
  rs.min
end

puts calc(paths)
