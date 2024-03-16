# require "ac-library-rb/segtree"

S = gets.chomp
l = S.length



# simple
# ss = S.split('')

# results = (0...l).to_a.combination(2).map do |i, j|
#   s = ss.dup
#   s[i], s[j] = s[j], s[i]

#   pp [i, j, s]
#   s.join
# end


# [0, 1, ["a", "a", "b", "b", "c", "c"]] # a
# [2, 3, ["a", "a", "b", "b", "c", "c"]] # b
# [4, 5, ["a", "a", "b", "b", "c", "c"]] # c

# [0, 2, ["b", "a", "a", "b", "c", "c"]]
# [0, 3, ["b", "a", "b", "a", "c", "c"]]
# [0, 4, ["c", "a", "b", "b", "a", "c"]]
# [0, 5, ["c", "a", "b", "b", "c", "a"]]
# [1, 2, ["a", "b", "a", "b", "c", "c"]]
# [1, 3, ["a", "b", "b", "a", "c", "c"]]
# [1, 4, ["a", "c", "b", "b", "a", "c"]]
# [1, 5, ["a", "c", "b", "b", "c", "a"]]
# [2, 4, ["a", "a", "c", "b", "b", "c"]]
# [2, 5, ["a", "a", "c", "b", "c", "b"]]
# [3, 4, ["a", "a", "b", "c", "b", "c"]]
# [3, 5, ["a", "a", "b", "c", "c", "b"]]


# pp results
# pp results.uniq
# puts results.uniq.size
# exit


# main

def c(l)
  l * (l - 1) / 2
end

if S == S[0] * l
  puts 1
  exit
end

r = c(l)
# pp r

kvs = S.split('').group_by(&:itself).map { |k, v| [k, v.count] }



kvs.each do |k, v|
  # pp [k, v]
  r -= c(v)
end
# pp r

r = r + 1 unless kvs.map { |k, v| v } .all?(1)
# pp r

puts r
