# require "ac-library-rb/priority_queue"
require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# N = STDIN.gets.chomp.to_i
# AS = (1..N).map do
#   STDIN.gets.chomp.split.map(&:to_i)
#   STDIN.gets.chomp.to_i
# end

# pq = AcLibraryRb::PriorityQueue.new


H, W = STDIN.gets.chomp.split.map(&:to_i)
SS = (1..H).map do
  STDIN.gets.chomp.split('')
end


board = (0...H).map do |i|
  (0...W).map do |j|
    next 0 if SS[i][j] == '#'
    next 1 if 0 < i && SS[i - 1][j] == '#'
    next 1 if i < H - 1 && SS[i + 1][j] == '#'
    next 1 if 0 < j && SS[i][j - 1] == '#'
    next 1 if j < W - 1 && SS[i][j + 1] == '#'
    nil
  end
end

pp board if $debug

dsu = AcLibraryRb::DSU.new(H * W)

(0...H).each do |i|
  (0...W).each do |j|
    next unless board[i][j] == nil
    if i < H - 1 && board[i + 1][j] == nil
      pp [[i, j], [i + 1, j]] if $debug
      dsu.merge(i * W + j, (i + 1) * W + j)
    end
    if j < W - 1 && board[i][j + 1] == nil
      pp [[i, j], [i, j + 1]] if $debug
      dsu.merge(i * W + j, i * W + (j + 1))
    end
  end
end

pp dsu.groups if $debug


results = dsu.groups.map do |group|
  ones = []
  if group.length == 1
    k = group[0]
    i = k / W
    j = k % W
    next 1 if board[i][j] == 0 || board[i][j] == 1
  end
  group.each do |k|
    i = k / W
    j = k % W
    # pp "[i, j] = [#{i}, #{j}]" if $debug
    ones << [i - 1, j] if 0 < i && board[i - 1][j] == 1
    ones << [i + 1, j] if i < H - 1 && board[i + 1][j] == 1
    ones << [i, j - 1] if 0 < j && board[i][j - 1] == 1
    ones << [i, j + 1] if j < W - 1 && board[i][j + 1] == 1
  end
  pp [group, ones.uniq] if $debug

  group.length + ones.uniq.length
end


puts results.max