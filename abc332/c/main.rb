n, m = gets.split(' ').map(&:to_i)
s = gets.chomp

def check(l, m)
  data = l.split('')
  n1 = data.count('1')
  n2 = data.count('2')
  #pp [data, l, n1, n2]
  if m < n1
    n2 + (n1 - m)
  else
    n2
  end
end

result = s.split('0').compact.map{ |l| check(l, m) }
puts result.length > 0 ? result.max : 0
