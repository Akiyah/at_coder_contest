N = gets.chomp.to_i
ABS = (1..N).map { gets.chomp.split.map(&:to_i) }

# def check(abs)
#   data = []
#   abs.each do |a, b|
#     a, b = b, a if b < a
#     data.each do |a2, b2|
#       cond1 = (a2 < a && a < b2)
#       cond2 = (a2 < b && b < b2)
#       return 'Yes' if cond1 && !cond2
#       return 'Yes' if !cond1 && cond2
#     end
#     data << [a, b]
#   end

#   'No'
# end

def check(n, abs)
  data = Array.new(n * 2, 0)
  # pp data
  abs.each do |a, b|
    a, b = b, a if b < a
    # pp [a, b]
    data[a - 1] += 1
    data[b - 1] += -1
  end

  pp data

  h = 0
  data.each do |a|
    h += a
    return 'Yes' if 1 < h
  end

  'No'
end

puts check(N, ABS)