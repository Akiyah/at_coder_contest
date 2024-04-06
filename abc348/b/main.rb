# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

# A, B, C = STDIN.gets.chomp.split.map(&:to_i)
N = STDIN.gets.chomp.to_i
XYS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

(0...N).map do |i|
  xi, yi = XYS[i]

  d_max = 0
  x_max = 0
  y_max = 0
  j_max = nil
  (0...N).map do |j|
    next if i == j

    xj, yj = XYS[j]
    
    d = (xi - xj) ** 2 + (yi - yj) ** 2

    if d_max < d
      d_max = d
      x_max, y_max = xj, yj
      j_max = j
    end
  end

  puts [x_max, y_max].join(' ') if $debug
  puts j_max + 1
end
