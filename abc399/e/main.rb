#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
S = STDIN.gets.chomp
T = STDIN.gets.chomp

cp_a = 'a'.codepoints[0]
cp_z = 'z'.codepoints[0]
m = cp_z - cp_a + 1

ss = S.codepoints.map { |cp| cp - cp_a}
ts = T.codepoints.map { |cp| cp - cp_a}

def loop_length(paths, a)
  ds = {}
  ds[a] = 0

  while next_a = paths[a]
    return nil unless next_a # loopが存在しない

    if ds[next_a] # loopを見つけた
      l = (ds[a] + 1) - ds[next_a]
      return l
    end

    ds[next_a] = ds[a] + 1
    a = next_a
  end
end

def calc_group(paths, group) # return [count, use_chars, free_char_exist]
  a = group[0]
  gl = group.length

  if gl == 1
    if paths[a]
      return [0, 1, false]
    else
      return [0, 0, true]
    end
  end

  ll = loop_length(paths, a)

  if ll == nil
    [gl - 1, gl, true]
  elsif ll == 1
    [gl - 1, gl, true]
  elsif ll == gl
    [gl + 1, gl, false]
  else
    [gl, gl, true]
  end
end

def calc(ss, ts, m)
  paths = {}
  dsu = AcLibraryRb::DSU.new(m)
  
  N.times do |i|
    k = ss[i]
    v = ts[i]
    # next if k == v
    return -1 if paths[k] && paths[k] != v

    paths[k] = v
    dsu.merge(k, v)
  end

  pp({paths:, "dsu.groups" => dsu.groups}) if $debug

  # if ('a'..'z').all? { |k| paths[k] }
  #   return -1
  # end

  # return -1 if m.values.length == 26 && 0 < m2.keys.length

  rs = dsu.groups.map do |group|
    calc_group(paths, group) #  [count, use_chars, free_char_exist]
  end

  pp({rs:}) if $debug

  free_char_exist = rs.any? { |count, use_chars, free_char_exist| free_char_exist }
  use_chars = rs.map { |count, use_chars, free_char_exist| use_chars }.sum
  count = rs.map { |count, use_chars, free_char_exist| count }.sum
  # m2.keys.length + loop_count

  if !free_char_exist && use_chars == 26
    count == 0 ? 0 : -1
  else
    count
  end
end

puts calc(ss, ts, m)

