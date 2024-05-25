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

def check
  board = Array.new(N * N, false)

  AS.each.with_index do |a, i|
    board[a - 1] = i + 1
  end

  pp board if $debug

  max_t = nil

  (0...N).each do |row|
    r = (0...N).all? do |i| # 横
      board[row * N + i]
    end
    if r
      t = (0...N).map { |i| # 横
        board[row * N + i]
      }.max
      pp '-' + "#{t}" if $debug
      max_t = t if max_t == nil
      max_t = [t, max_t].min
    end
  end

  (0...N).each do |column|
    r = (0...N).all? do |i| # 横
      board[i * N + column]
    end
    if r
      t = (0...N).map { |i| # 横
        board[i * N + column]
      }.max
      pp '|' + "#{t}" if $debug
      max_t = t if max_t == nil
      max_t = [t, max_t].min
    end
  end

  r = (0...N).all? do |i| # 斜め
    board[i * N + i]
  end
  if r
    t = (0...N).map { |i| # 横
      board[i * N + i]
    }.max
    pp '\\' + "#{t}" if $debug
    max_t = t if max_t == nil
    max_t = [t, max_t].min
  end

  r = (0...N).all? do |i| # 逆斜め
    board[i * N + (N - i - 1)]
  end
  if r
    t = (0...N).map { |i| # 横
      board[i * N + (N - i - 1)]
    }.max
    pp '/' + "#{t}" if $debug
    max_t = t if max_t == nil
    max_t = [t, max_t].min
  end

  max_t ? max_t : -1
end

puts check
