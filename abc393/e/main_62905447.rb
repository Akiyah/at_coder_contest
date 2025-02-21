(N, K), A = readlines.map{_1.split.map(&:to_i)}

M = A.max
s, t, u = Array.new(M + 1, 0), Array.new(M + 1, 0), Array.new(M + 1, 1)
A.each{|d| s[d] += 1}
t[1] = N
(2..M).each do |d|
  i = d
  while i <= M
    t[d] += s[i]
    i += d
  end
end
(2..M).each do |d|
  next if t[d] < K
  i = d
  while i <= M
    pp({d:, i:, M:}) if d <= u[i]
    u[i] = [u[i], d].max
    i += d
  end
end
# pp({u:})
puts A.map{u[_1]}
