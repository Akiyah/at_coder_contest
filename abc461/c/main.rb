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

N, K, M = STDIN.gets.chomp.split.map(&:to_i)
CVS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc
  vis = []
  cvs = {}
  max_c_v = {}
  CVS.each.with_index do |(c, v), i|
    vis << [v, i, true]
    cvs[c] ||= []
    cvs[c] << v
    if !max_c_v[c]
      max_c_v[c] = [v, i]
    elsif max_c_v[c][0] < v
      max_c_v[c] = [v, i]
    end
  end

  pp(vis:) if $debug
  pp(cvs:) if $debug
  pp(max_c_v:) if $debug
  pp(max_c_v.values) if $debug

  max_vis = max_c_v.values.sort_by { |v, i| v }.reverse
  # max_c_v.each do |c, (v, i)|
  #   vis[i][2] = false
  # end

  pp(max_vis:) if $debug


  l = cvs.keys.length

  r1 = 0
  max_vis[0...M].each do |v, i|
    r1 += v
    vis[i][2] = false
  end
  pp(r1:) if $debug

  vis2 = vis.select { |v, i, b| b }.sort_by { |v, i, b| v }.reverse
  r2 = vis2[0...(K - M)].map { |v, i, b| v }.sum
  pp(r2:) if $debug
  r1 + r2
end


puts calc




