# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

# inf = (1 << 60) - 1
# seg_max = AcLibraryRb::Segtree.new(rs, -inf) { |x, y| [x, y].max }


N, T = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)

def check_one(board, a)
  pp a if $debug
  board[a] = true

  row = a / N
  r = (0...N).all? do |i| # 横
    board[row * N + i]
  end
  return true if r

  column = a % N
  r = (0...N).all? do |i| # 縦
    board[i * N + column]
  end
  return true if r

  if row == column
    r = (0...N).all? do |i| # 斜め
      board[i * N + i]
    end
    return true if r
  end

  if row + column == N - 1
    r = (0...N).all? do |i| # 逆斜め
      pp board if $debug
      pp board[i * N + (N - i - 1)] if $debug
      board[i * N + (N - i - 1)]
    end
    return true if r
  end

  false
end

def check
  board = Array.new(N * N, false)

  AS.each.with_index do |a, i|
    if check_one(board, a - 1)
      return i + 1
    end
  end
  
  -1
end

puts check
