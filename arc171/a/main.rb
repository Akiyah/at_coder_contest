T = gets.chomp.to_i

def check(n, a, b)
  return 'No' if n < a

  if a * 2 <= n
    if n % 2 == 0
      return b <= (n / 2) * (n - a) ? 'Yes' : 'No'
    else
      return b <= (n / 2 + 1) * (n - a) ? 'Yes' : 'No'
    end
  else
    return b <= (n - a) * (n - a) ? 'Yes' : 'No'
  end

end

(1..T).each do |i|
  n, a, b = gets.chomp.split.map(&:to_i)
  puts check(n, a, b)
end


