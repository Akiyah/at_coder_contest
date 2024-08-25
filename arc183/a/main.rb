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


N, K = STDIN.gets.chomp.split.map(&:to_i)



def calc(as, k)
  n = as.length

  if n == 0
    return []
  end

  if n % 2 != 0
    n2 = (n + 1) / 2 # 3 -> 2
    return ([n2] * K) + calc(as - [n2], k)
  end

  # n % 2 == 0
  n2 = n / 2 # 2 -> 1, 4 -> 2, 6 -> 3
  ss = [n2] + as.sort.reverse.map do |i|
    if i == n2
      [i] * (K - 1)
    else
      [i] * K
    end
  end.flatten
  ss
end



puts calc((1..N).to_a, K).join(' ')

