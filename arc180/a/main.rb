$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
S = STDIN.gets.chomp

R = 10 ** 9 + 7

def short_split(s)
  s = s.gsub(/AA+/, 'A,A').gsub(/BB+/, 'B,B')
  s.split(',')
end

ts = short_split(S)

c = 1
ts.each do |t|
  n = t.length
  next if n <= 2

  c *= (n + 1) / 2
  c %= R
end

puts c % R
