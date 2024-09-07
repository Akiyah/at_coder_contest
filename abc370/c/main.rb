# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


S = STDIN.gets.chomp
T = STDIN.gets.chomp



def count(ss, ts)
  l = ss.size
  xs = []
  ys = []
  (1..l).each do |i|
    if ss[i - 1] < ts[i - 1]
      xs << i
    elsif ss[i - 1] > ts[i - 1]
      ys << i
    else
    end
  end

  pp xs if $debug
  pp ys if $debug

  rs = ys.map do |i|
    ss[i - 1] = ts[i - 1]
    ss.join('')    
  end  
  rs += xs.reverse.map do |i|
    ss[i - 1] = ts[i - 1]
    ss.join('')
  end  



  rs
end

rs = count(S.split(''), T.split(''))
puts rs.size
rs.each do |r|
  puts r
end
