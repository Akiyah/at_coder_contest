
n = gets.chomp.to_i

MEMO = {}
def calc(i)
  return 0 if i == 1

  return MEMO[i] if MEMO[i]

  if i % 2 == 0
    MEMO[i] = i + calc(i / 2) * 2
    return MEMO[i]
  else
    MEMO[i] = i + calc(i / 2) + calc(i / 2 + 1)
    return MEMO[i]
  end
end


r = calc(n)

# pp MEMO

puts r
