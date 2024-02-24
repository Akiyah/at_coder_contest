require 'prime'

N = gets.chomp.to_i
AS = gets.chomp.split.map(&:to_i).sort

AS_zero = AS.select { |a| a == 0 }
AS_nonzero = AS.select { |a| 0 < a }

m = AS_zero.length
result_zero = N * m - m * (m + 1) / 2

pds = AS_nonzero.map do |a|
  pd = a.prime_division
  x = 1
  pd.each do |p, d|
    x *= p unless d % 2 == 0
  end
  x
end

result_nonzero = 0
pds = pds.sort.group_by(&:itself).map { |k, v| [k, v.length] }
pds.each do |p, m|
  result_nonzero += m * (m - 1) / 2
end


puts result_zero + result_nonzero