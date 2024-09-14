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
XS = STDIN.gets.chomp.split.map(&:to_i)
PS = STDIN.gets.chomp.split.map(&:to_i)
Q = STDIN.gets.chomp.to_i
LRS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

s = 0
PS2 = PS.map do |p|
  s += p
  s
end # 左側からの総和にする

def calc_sum(x) # binary search
  pp ['calc_sum', x] if $debug

  if XS[N - 1] <= x
    return PS2[N - 1]
  end

  if x < XS[0]
    return 0
  end

  i = 0 # 一番左
  l = N - 1



  loop do
    pp [i, l, XS[i], x, XS[i + 1]] if $debug

    if XS[i] <= x && x < XS[i + 1]
      puts PS2[i] if $debug
      return PS2[i]
    end

    if x <= XS[i]
      i -= l
      i = 0 if i < 0
    else
      i += l
      i = N - 1 if N - 1 <= i
    end

    l = ((l + 1) / 2)


  end
end

def calc(l, r)
  # pp [l, r, calc_sum(r), calc_sum(l - 1), calc_sum(r) - calc_sum(l - 1)] if $debug
  calc_sum(r) - calc_sum(l - 1)
end

LRS.each do |l, r|
  puts calc(l, r)
end
