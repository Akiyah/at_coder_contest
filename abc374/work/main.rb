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

N, X = STDIN.gets.chomp.split.map(&:to_i)
APBQS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


APBQS.each do |a, p, b, q|
  
end




m = (0...N).to_a.permutation.map do |ps|
  calc(ps)
end.min


def check_one(w, i)
  
end

def check(w)
  (0...N).all? { |i| check_one(w, i) }
end

def calc
  w0 = 0 # 初期状態：成立
  w1 = 10 ** 7 # 初期状態：不成立

  while w1 - w0 > 1
    w = (w0 + w1) / 2

    if check(w) # 上げる
      w0 = w
    else # 下げる
      w1 = w
    end
  end

  w0
end



puts m
