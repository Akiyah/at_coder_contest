# require "ac-library-rb/segtree"


S = gets.chomp

k = S.length

if k < 2
  puts 'No'
else
  if S[0] == '<' && S[-1] == '>' && S[1...-1] == '=' * (k - 2)
    puts 'Yes'
  else
    puts 'No'
  end
end