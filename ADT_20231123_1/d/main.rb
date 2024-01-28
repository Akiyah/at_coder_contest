s = gets.chomp
t = gets.chomp

def check(s, t)
  return true if s == t

  l = s.length
  (0...(l - 1)).each do |i|
    a = s.split('')
    a[i], a[i + 1] = a[i + 1], a[i]
    # pp [s, i, a, t]
    return true if a.join('') == t
  end

  false
end

if check(s, t)
  puts 'Yes'
else
  puts 'No'
end