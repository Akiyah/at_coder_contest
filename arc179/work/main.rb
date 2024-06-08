$debug = !ARGV[0].nil?

M, N = STDIN.gets.chomp.split.map(&:to_i)
XS = STDIN.gets.chomp.split.map(&:to_i)

R = 998244353


def create_nss(xs, m)
  rxs = Array.new(M, 0)
  xs.each.with_index do |x, i|
    rxs[x - 1] += (1 << i)
  end

  nss = Array.new(1 << m) { [] }
  (1 << m).times do |n|
    n.digits(2).each.with_index do |d, i|
      next if d == 0
      n2 = n & ~(1 << i) | rxs[i]
      nss[n2] << n
    end
  end
  nss
end

def count(rs, m, r)
  nss = create_nss(rs, m)
  dp = Array.new(1 << m, 0)
  dp[(1 << m) - 1] = 1 # first status

  N.times do |i|
    dp = nss.map { |ns| ns.sum { |n| dp[n] } }
    if i % 12 == 0
      dp = dp.map { |d| d % r }
    end
  end
  dp.sum % r
end

puts count(XS, M, R)
