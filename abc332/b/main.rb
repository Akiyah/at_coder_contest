k, g, m = gets.split(' ').map(&:to_i)

def check(k, g, m)
  glass = 0
  mag = 0
  #pp [glass, mag]
  k.times do |i|
    if glass == g
      glass = 0
    elsif mag == 0
      mag = m
    else
      if mag <= g - glass
        glass += mag
        mag = 0
      else
        mag -= (g - glass)
        glass = g
      end
    end
    # pp [i, glass, mag]
  end
  [glass, mag]
end

result = check(k, g, m)
puts result.join(' ')