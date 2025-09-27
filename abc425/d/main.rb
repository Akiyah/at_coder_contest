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
SS = (1..H).map do
  STDIN.gets.chomp.split('')
end

ss = SS.map do |line|
  line.map { |s| s == '#' }
end

def update_ts2(ts, ss, i2, j2)
  if ts[i2][j2] == true # すでにカウントしているため解除
    ts[i2][j2] = false
    return -1
  end
  if ts[i2][j2] == false
    return 0
  end

  i = 0
  i += 1 if 0 < i2 && ss[i2 - 1][j2]
  i += 1 if i2 + 1 < H && ss[i2 + 1][j2]
  i += 1 if 0 < j2 && ss[i2][j2 - 1]
  i += 1 if j2 + 1 < W && ss[i2][j2 + 1]

  if i == 1
    ts[i2][j2] = true
    1
  else
    0
  end
end

def update_ts(ts, ss, i, j)
  c = 0
  if 0 < i && !ss[i - 1][j]
    i2 = i - 1
    j2 = j
    c += update_ts2(ts, ss, i2, j2)
  end
  if i + 1 < H && !ss[i + 1][j]
    i2 = i + 1
    j2 = j
    c += update_ts2(ts, ss, i2, j2)
  end
  if 0 < j && !ss[i][j - 1]
    i2 = i
    j2 = j - 1
    c += update_ts2(ts, ss, i2, j2)
  end
  if j + 1 < W && !ss[i][j + 1]
    i2 = i
    j2 = j + 1
    c += update_ts2(ts, ss, i2, j2)
  end
  c
end


def calc(ss)
  
  ts = Hash.new { |hash, key| hash[key] = {} }
  H.times do |i|
    W.times do |j|
      update_ts(ts, ss, i, j) if ss[i][j]
    end
  end

  while true
    ts.each do |i, line|
      line.each do |j, b|
        if b
          ss[i][j] = true
        end
      end
    end

    next_ts = Hash.new { |hash, key| hash[key] = {} }
    next_count = 0
    ts.each do |i, line|
      line.each do |j, b|
        if b
          next_count += update_ts(next_ts, ss, i, j)
        end
      end
    end

    pp(ss:, next_ts:, next_count:) if $debug
    return ss if next_count == 0

    ts = next_ts
  end
end



rs = calc(ss)

r = 0
ss = rs.each do |line|
  line.each do |s|
    r += 1 if s
  end
end

puts r





