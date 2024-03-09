# require "ac-library-rb/segtree"




as = []
loop do
  a = gets.chomp.to_i
  as << a
  break if a == 0
end

puts as.reverse.join("\n")