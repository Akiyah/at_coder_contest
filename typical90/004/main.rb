# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

H, W = STDIN.gets.chomp.split.map(&:to_i)
AS = (1..H).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

column_sum = (1..H).map do |i|
  (1..W).sum do |j|
    AS[i - 1][j - 1]
  end
end

row_sum = (1..W).map do |j|
  (1..H).sum do |i|
    AS[i - 1][j - 1]
  end
end

pp column_sum if $debug
pp row_sum if $debug


bs = (1..H).map do |i|
  (1..W).map do |j|
    column_sum[i - 1] + row_sum[j - 1] - AS[i - 1][j - 1]
  end
end

bs.each do |b|
  puts b.join(' ')
end
