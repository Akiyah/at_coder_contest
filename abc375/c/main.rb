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

N = STDIN.gets.chomp.to_i
AS = (1..N).map do
  STDIN.gets.chomp.split('')
end


as = AS.dup

pp as if $debug


(0..(N / 2)).each do |i|
  l = N - 2 * i - 1

  if i % 4 == 0
    (i...(i + l)).each do |j|
      pp [i, j, l] if $debug
      as[j][N - 1 - i], as[N - 1 - i][N - 1 - j], as[N - 1 - j][i], as[i][j] = as[i][j], as[j][N - 1 - i], as[N - 1 - i][N - 1 - j], as[N - 1 - j][i]
      pp as if $debug
    end
  end
  if i % 4 == 1
    (i...(i + l)).each do |j|
      as[N - 1 - i][N - 1 - j], as[N - 1 - j][i], as[i][j], as[j][N - 1 - i] = as[i][j], as[j][N - 1 - i], as[N - 1 - i][N - 1 - j], as[N - 1 - j][i]
    end
  end
  if i % 4 == 2
    (i...(i + l)).each do |j|
      as[N - 1 - j][i], as[i][j], as[j][N - 1 - i], as[N - 1 - i][N - 1 - j] = as[i][j], as[j][N - 1 - i], as[N - 1 - i][N - 1 - j], as[N - 1 - j][i]
    end
  end

  pp as if $debug
end

# pp as if $debug

as.each do |a|
  puts a.join('')
end
