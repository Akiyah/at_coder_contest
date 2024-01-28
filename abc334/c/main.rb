n, k = gets.chomp.split(' ').map(&:to_i)
as = gets.chomp.split(' ').map(&:to_i)


def calc_even(as)
  n = as.size / 2
  (0...n).map do |i|
    as[i * 2 + 1] - as[i * 2] 
  end.sum
end

def calc_odd(as)
  n = as.size / 2
  bs = (0...n).map do |i|
    as[i * 2 + 1] - as[i * 2] 
  end
  b_sum = 0
  b2s = [0]
  bs.each do |b|
    b_sum += b
    b2s << b_sum
  end

  cs = (0...n).map do |i|
    as[i * 2 + 2] - as[i * 2 + 1]
  end.reverse
  c_sum = 0
  c2s = [0]
  cs.each do |c|
    c_sum += c
    c2s << c_sum
  end
  c2s = c2s.reverse

  #pp b2s
  #pp c2s

  c2s.map.with_index do |c2, i|
    b2s[i] + c2s[i]
  end.min
end


def calc(as)
  if as.size % 2 == 0
    calc_even(as)
  else
    calc_odd(as)
    #as.map do |a|
    #  calc_even(as.reject {|b| b == a })
    #end.min
  end
end

puts calc(as)

