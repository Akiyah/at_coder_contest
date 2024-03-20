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
  d0 = 1
  d1 = L / K + 1
  r0 = check(d0) # true
  r1 = check(d1) # false

  return d0 if d1 - d0 == 1

  loop do
    # pp [d0, r0, d1, r1]
    d = (d0 + d1) / 2

    r = check(d)

    if r
      d0 = d
      #d1 = d1
      r0 = r
      #r1 = r1
    else
      d0 = d0
      d1 = d
      #r0 = r0
      r1 = r
    end

    return d0 if d1 - d0 == 1
  end


  (1..L).each do |d|
  # [13, 14].each do |d|
    r = check(d)
    # pp [d, r]
    return d - 1 unless r
  end
end

puts calc
