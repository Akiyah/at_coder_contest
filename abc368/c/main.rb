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
HS = STDIN.gets.chomp.split.map(&:to_i)

def count_one(t0, h)
  t = t0
  if t % 3 == 0
    # 何もしない
  elsif t % 3 == 1
    return 1 if h <= 1
    t += 1
    h -= 1
    return 2 if h <= 3
    t += 1
    h -= 3
  elsif t % 3 == 2
    return 1 if h <= 3
    t += 1    
    h -= 3
  end

  # t は 3 の倍数
  t += (h / 5) * 3
  h = h % 5

  # h は5未満
  if h <= 0
    return t - t0
  end

  if h <= 1
    t += 1
    return t - t0
  end

  if h <= 2
    t += 2
    return t - t0
  end

  t += 3
  return t - t0
end

def count(hs)
  t = 0
  hs.each do |h|
    dt = count_one(t, h)
    t += dt
  end
  t
end


puts count(HS)
