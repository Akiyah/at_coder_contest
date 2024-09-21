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


N, Q = STDIN.gets.chomp.split.map(&:to_i)
S = STDIN.gets.chomp
XCS = (1..Q).map do
  x, c = STDIN.gets.chomp.split
  [x.to_i, c]
end


s = S.dup

def count_abc(s)
  s.scan(/ABC/).count
end




abcs = (0...(s.length - 2)).map do |i|
  s[i..(i + 2)] == 'ABC'
end

abcs_sum = abcs.map { |abc| abc ? 1 : 0 }.sum

pp abcs if $debug
pp abcs_sum if $debug

XCS.each do |x, c|
  x1 = x - 1

  pp [x, x1, c] if $debug
  pp [s, abcs, abcs_sum] if $debug
  

  if c == s[x1]
    puts abcs_sum # 何も変化はない
    next
  end


  if c == 'A'
    if x1 + 1 < N && s[x1 + 1] == 'B' && x1 + 2 < N && s[x1 + 2] == 'C'
      abcs_sum += 1
      abcs[x1] = true
    end

    if 0 <= x1 - 1 && x1 - 1 < N - 2
      if abcs[x1 - 1]
        abcs_sum -= 1
      end
      abcs[x1 - 1] = false
    end

    if 0 <= x1 - 2 && x1 - 2 < N - 2
      if abcs[x1 - 2]
        abcs_sum -= 1
      end
      abcs[x1 - 2] = false
    end

    puts abcs_sum
    s[x1] = c
    next
  end

  if c == 'B'
    if 0 <= x1 - 1 && s[x1 - 1] == 'A' && x1 + 1 < N && s[x1 + 1] == 'C'
      abcs_sum += 1
      abcs[x1 - 1] = true
    end

    if 0 <= x1 && x1 < N - 2
      if abcs[x1]
        abcs_sum -= 1
      end
      abcs[x1] = false
    end

    if 0 <= x1 - 2 && x1 - 2 < N - 2
      if abcs[x1 - 2]
        abcs_sum -= 1
      end
      abcs[x1 - 2] = false
    end

    puts abcs_sum
    s[x1] = c
    next
  end

  if c == 'C'
    if 0 <= x1 - 2 && s[x1 - 2] == 'A' && 0 <= x1 - 1 && s[x1 - 1] == 'B'
      abcs_sum += 1
      abcs[x1 - 2] = true
    end

    if 0 <= x1 && x1 < N - 2
      if abcs[x1]
        abcs_sum -= 1
      end
      abcs[x1] = false
    end

    if 0 <= x1 - 1 && x1 - 1 < N - 2
      if abcs[x1 - 1]
        abcs_sum -= 1
      end
      abcs[x1 - 1] = false
    end

    puts abcs_sum
    s[x1] = c
    next
  end


  # c != A, B, C
  if 0 <= x1 && x1 < N - 2
    if abcs[x1]
      abcs_sum -= 1
    end
    abcs[x1] = false
  end

  if 0 <= x1 - 1 && x1 - 1 < N - 2
    if abcs[x1 - 1]
      abcs_sum -= 1
    end
    abcs[x1 - 1] = false
  end

  if 0 <= x1 - 2 && x1 - 2 < N - 2
    if abcs[x1 - 2]
      abcs_sum -= 1
    end
    abcs[x1 - 2] = false
  end

  s[x1] = c
  puts abcs_sum

  # s[x - 1] = c

  # puts count_abc(s)
end


pp [s, abcs, abcs_sum] if $debug
