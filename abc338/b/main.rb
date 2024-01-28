S = gets.chomp

ss = S.split('')

result =  ss.group_by {|s| s}.to_a.map { |s, g| [-g.length, s] }.sort


puts result[0][1]