N = gets.chomp.to_i
AS = gets.chomp.split.map(&:to_i)

m = 0
m_min = 0
AS.each do |a|
  m += a
  if m < m_min
    m_min = m
  end
end

# pp [m, m_min]
if m_min < 0
  puts m - m_min
else
  puts m
end
