# require "ac-library-rb/segtree"

N, L = gets.chomp.split.map(&:to_i)
K = gets.chomp.to_i
AS = gets.chomp.split.map(&:to_i)

# pp [N, L, K, AS]

def check(d)
  m = 0
  e = 0
  last_a = 0
  AS.each do |a|
    e += a - last_a
    # pp "e: #{e}"
    last_a = a
    if d <= e
      # pp "d <= e: #{d} <= #{e}"
      e = 0
      m += 1
      if K == m
        return d <= L - a
      end
    end
  end
  false
end

def calc
  (1..L).each do |d|
  # [13, 14].each do |d|
    r = check(d)
    # pp [d, r]
    return d - 1 unless r
  end
end

puts calc
