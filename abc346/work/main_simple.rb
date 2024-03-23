# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

H, W, M = STDIN.gets.chomp.split.map(&:to_i)
TAXS = (1..M).map { STDIN.gets.chomp.split.map(&:to_i) }

def calc
  board = Array.new(H) { Array.new(W, 0) }

  pp board if $debug
  TAXS.each do |t, a, x|
    if t == 1
      (0...W).each { |j| board[a - 1][j] = x }
    else
      (0...H).each { |i| board[i][a - 1] = x }
    end
    pp board if $debug
  end

  board.flatten.group_by(&:itself).transform_values(&:count)
end

b = calc

puts b.keys.count
b.keys.sort.each do |k|
  puts "#{k} #{b[k]}"
end
