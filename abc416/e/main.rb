#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N, M = STDIN.gets.chomp.split.map(&:to_i)
ABCS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
K, T = STDIN.gets.chomp.split.map(&:to_i)
DS = STDIN.gets.chomp.split.map(&:to_i)

Q = STDIN.gets.chomp.to_i


def add_path(paths, a, b, c)
  paths[a] ||= {}
  paths[a][b] = c if !paths[a][b] || c < paths[a][b]
  paths[b] ||= {}
  paths[b][a] = c if !paths[b][a] || c < paths[b][a]
end


def calc_length(paths, i)
  pp(name: 'calc_length', paths:, i:) if $debug

  pq = AcLibraryRb::PriorityQueue.new() { |(i1, c1), (i2, c2)| c1 < c2 }
  pq.push([i, 0])
  goals = {}

  while !pq.empty?
    pp(pq:, goals:) if $debug
    i1, c1 = pq.pop
    pp(i1:, c1:) if $debug
    next if goals[i1]
    goals[i1] = c1
    next unless paths[i]
    pp('paths[i1]' => paths[i1]) if $debug
    paths[i1].each do |i2, c2|
      unless goals[i2]
        pq.push([i2, c1 + c2])
      end
    end
  end
  pp(goals:) if $debug

  r = ((i + 1)..N).map do |j|
    goals[j] || 0
  end.sum
  pp(r:) if $debug
  r * 2
end



def calc_sum(paths)
  return 0 if N == 1

  (0..(N - 2)).map do |i|
    calc_length(paths, i)
  end.sum
end

def calc_one(query, board, paths, ds)
  # pp(query:) if $debug
  pp(query:, board:, paths:, ds:) if $debug
  s = query[0].to_i
  if s == 1
    _, x, y, t = query
    x = x.to_i - 1
    y = y.to_i - 1
    t = t.to_i
    add_path(paths, x, y, t)
    update_board(board, paths, x, y)
    update_board(board, paths, y, x)
  elsif s == 2
    _, x = query
    x = x.to_i - 1
    if !ds[x]
      ds.keys.each do |d|
        add_path(paths, d, x, T)
        update_board(board, paths, d, x)
        update_board(board, paths, x, d)
      end
      ds[x] = true
    end
  else # s == 3
    #puts calc_sum(paths)
    puts calc_sum_board(board)
  end
end

def calc_sum_board(board)
  N.times.map do |x|
    N.times.map do |y|
      board[x][y] || 0
    end.sum
  end.sum
end

def update_board(board, paths, x, y)
  N.times do |x2|
    next unless board[x2][x]
    N.times do |y2|
      next unless board[y][y2]
      if !board[x2][y2] || board[x2][x] + paths[x][y] + board[y][y2] < board[x2][y2]
        board[x2][y2] = board[x2][x] + paths[x][y] + board[y][y2]
      end
    end
  end
end

def create_board(paths, ds)
  board = Array.new(N) { Array.new(N) }

  dp = []
  N.times do |x|
    board[x][x] = 0
    dp << [x, x]
  end

  while 0 < dp.length
    x, y = dp.shift

    if paths[y]
      paths[y].each do |y2, t2|
        if !board[x][y2] || board[x][y] + t2 < board[x][y2] 
          board[x][y2] = board[x][y] + t2
          dp << [x, y2]
        end
      end
    end
  end

  board
end

def calc
  paths = {}
  ABCS.each do |a, b, c|
    add_path(paths, a - 1, b - 1, c)
  end
  ds = {}
  DS.each { |d| ds[d - 1] = true }
  ds.keys.combination(2) do |d1, d2|
    add_path(paths, d1, d2, T)
  end

  board = create_board(paths, ds)
  pp(board:) if $debug

  Q.times do
    query = STDIN.gets.chomp.split
    calc_one(query, board, paths, ds)
  end
end


calc



