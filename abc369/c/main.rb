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
AS = STDIN.gets.chomp.split.map(&:to_i)


if N == 1
  puts 1
  exit
end

if N == 2
  puts 3
  exit
end


last_a = nil
c = 0
r = N # 1このパターンはここで足しておく
d = nil
AS.each.with_index do |a, i|
  pp [a, i] if $debug

  if i == 0
    last_a = a
    c = 0
    next
  end

  if d == nil
    d = a - last_a
    last_a = a
    c += 1
    next
  end

  if i < N - 1
    if d == a - last_a
      c += 1
    else
      r += (c + 1) * c / 2
      c = 1
    end
  end

  if i == N - 1
    if d == a - last_a
      c += 1

      r += (c + 1) * c / 2
      c = 1
    else
      r += (c + 1) * c / 2
      c = 1

      r += 1 # 最後のいっことその前
    end
  end

  d = a - last_a
  pp [a, i, d, c, r] if $debug
  last_a = a
end


puts r
