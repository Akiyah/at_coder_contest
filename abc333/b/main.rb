s1, s2 = gets.split('')
t1, t2 = gets.split('')

s1i = "ABCDE".split('').find_index(s1)
s2i = "ABCDE".split('').find_index(s2)
t1i = "ABCDE".split('').find_index(t1)
t2i = "ABCDE".split('').find_index(t2)

# pp [s1i, s2i, t1i, t2i]

i = (s1i - s2i) % 5
j = (t1i - t2i) % 5

# pp [s1i, s2i, t1i, t2i, i, j]

if [0, 1, 2 ,2, 1][i] == [0, 1, 2 ,2, 1][j]
  puts 'Yes'
else
  puts 'No'
end
