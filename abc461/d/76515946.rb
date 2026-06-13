# frozen_string_literal: true

H, W, K = gets.split.map(&:to_i)
S = Array.new(H){gets.chomp.chars.map(&:to_i)}

ans = 0
ct = Array.new(H * W + 1, 0)
(0...H).each do |r1|
  c = Array.new(W, 0)
  (r1...H).each do |r2|
    r = S[r2]
    j = 0
    while j < W
      c[j] += r[j]
      j += 1
    end
    p = 0
    h = []
    ct[0] = 1
    h << 0
    j = 0
    while j < W
      p += c[j]
      t = p - K
      ans += ct[t] if t >= 0
      h << p if ct[p] == 0
      ct[p] += 1
      j += 1
    end
    h.each { |val| ct[val] = 0 }
  end
end
puts ans