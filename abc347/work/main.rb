# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

A, B, C = STDIN.gets.chomp.split.map(&:to_i)

def to_s2_60(x)
  x.to_s(2).rjust(60)
end

def calc()
  pp [A, B, C, C.to_s(2), C.to_s(2).length] if $debug
  
  s = C.to_s(2)
  l = s.length
  ss = s.split('')
  m = ss.count('1')

  d = (A - B).abs
  return -1 if m < d

  if m % 2 == 0
    return -1 unless d % 2 == 0
  else
    return -1 if d % 2 == 0
  end

  a0 = (m + d) / 2
  b0 = (m - d) / 2
  a0, b0 = b0, a0 if A < B

  k = (A - a0) # 残りの1として可能な数

  return -1 if (60 - m) < k

  #   k = (60 - m) - (A - a0) # 残りの1の数

  pp ['m', 'k', 'a0', 'b0'] if $debug
  pp [m, k, a0, b0] if $debug

  ss_a = []
  ss_b = []
  j = 0
  ss.reverse.each do |c|
    if c == '1'
      if j < a0
        ss_a << '1'
        ss_b << '0'
      else
        ss_a << '0'
        ss_b << '1'
      end
      j += 1
    else
      if k > 0
        ss_a << '1'
        ss_b << '1'
        k -= 1
      else
        ss_a << '0'
        ss_b << '0'
      end
    end
  end

  if 0 < k
    ss_a += ['1'] * (k)
    ss_b += ['1'] * (k)
  end

  ss_a.reverse!
  ss_b.reverse!

  x = ss_a.join('').to_i(2)
  y = ss_b.join('').to_i(2)

  if $debug
    actual_cs = ss_a.zip(ss_b).map do |a, b|
      (a != b && (a == '1' || b == '1')) ? '1' : '0'
    end
    # pp actual_cs.join('')


    puts "x:        " + to_s2_60(x)
    puts "y:        " + to_s2_60(y)
    puts "actual:   " + to_s2_60(actual_cs.join('').to_i(2))
    puts "expected: " + to_s2_60(C)



    actual = {
      a: x.to_s(2).split('').count('1'),
      b: y.to_s(2).split('').count('1'),
      c2: to_s2_60(actual_cs.join('').to_i(2)),
      c: actual_cs.join('').to_i(2)
    }

    expected = {
      a: A,
      b: B,
      c2: to_s2_60(C),
      c: C
    }

    pp actual
    pp expected


  end


  [x, y].join(' ')

end


puts calc()


