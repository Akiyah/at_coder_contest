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

Q = STDIN.gets.chomp.to_i
QUERYS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

balls = Hash.new(0)
ball_count = 0

QUERYS.each do |type, x|
  pp [type, x, balls] if $debug
  if type == 1
    ball_count += 1 if balls[x] == 0
    balls[x] += 1
  elsif type == 2
    balls[x] -= 1
    if balls[x] == 0
      balls.delete(x)
      ball_count -= 1
    end
  else
    puts ball_count
  end
end
