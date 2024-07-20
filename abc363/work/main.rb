require "ac-library-rb/priority_queue"
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


def calc(n)
  if n == 1
    return 0
  end

  k = 0 # 桁
  j = 1
  while true
    # 奇数桁
    j2 = j + 9 * (10 ** (k / 2))
    pp [k, j, j2] if $debug
    if n <= j2 # j2 が n を超えたら
      n2 = n - j - 1
      n3 = (10 ** (k / 2)) + n2
      s3 = n3.to_s
      pp ['*', n2, n3, s3] if $debug
      return s3 + s3[0..-2].reverse
    end
    j = j2
    k += 1

    # 偶数桁
    j2 = j + 9 * (10 ** (k / 2))
    pp [k, j, j2] if $debug
    if n <= j2 # j2 が n を超えたら
      n2 = n - j - 1
      n3 = (10 ** (k / 2)) + n2
      s3 = n3.to_s
      pp ['*', n2, n3, s3] if $debug
      return s3 + s3.reverse
    end
    j = j2
    k += 1
  end
end

r = calc(N)
puts r
