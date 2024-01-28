S = gets.chomp

if 1 < S.length
  puts S[0] == S[0].upcase && S[1..-1] == S[1..-1].downcase ? 'Yes' : 'No'
else
  puts S[0] == S[0].upcase ? 'Yes' : 'No'
end
