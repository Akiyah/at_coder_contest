require 'matrix'

B = 7
N = 3
CS = [1, 4, 9]

m = Matrix.unit(B)
N.times do |i|
  m1 = Matrix.zero(B)
  CS.each do |c|
    c2 = c * (10 ** i)
    B.times do |b|
      m1[(c2 + b) % B, b] += 1
    end
  end
  m *= m1
end

pp m
pp m[0, 0]
