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

N = STDIN.gets.chomp.to_i
S = STDIN.gets.chomp
T = STDIN.gets.chomp

S0 = S + '..'
T0 = T + '..'

# s = S + '  '
# t = (T.split("").map { |t| t == 'B' ? 1 : 2 }.join('') + '00').to_i

def check()
  return 0 if S == T
  lines = [{s: S + '..', s1: S, s2: ''}]
  lines_old = {}
  lines_old[S + '..'] = true

  step = 1
  while true
    pp ['step', step] if $debug
    pp lines if $debug
    pp lines_old if $debug
  
    lines_new = []

    lines.each do |line|
      s = line[:s]
      s1 = line[:s1]
      s2 = line[:s2]

      (0..(s1.length - 2)).each do |i|
        pp [line, 'i1', i] if $debug
        s1a = s1[0...i] || ''
        s1b = s1[i...(i + 2)] || ''
        s1c = s1[(i + 2)..-1] || ''

        s1_ = s1a
        s2_ = s1c + s1b + s2
        s_ = s1_ + '..' + s2_
        return step if s_ == T0
        unless lines_old[s_]
          lines_new.push({s: s_, s1: s1_, s2: s2_})
          lines_old[s_] = true
        end
      end
    
      (0..(s2.length - 2)).each do |i|
        pp [line, 'i2', i] if $debug
        s2a = s2[0...i] || ''
        s2b = s2[i...(i + 2)] || ''
        s2c = s2[(i + 2)..-1] || ''
    
        s1_ = s1 + s2b + s2a
        s2_ = s2c
        s_ = s1_ + '..' + s2_
        return step if s_ == T0
        unless lines_old[s_]
          lines_new.push({s: s_, s1: s1_, s2: s2_})
          lines_old[s_] = true
        end
      end

    end

    if lines_new.length == 0
      return -1
    end

    lines = lines_new
    step += 1
  end


end


r = check()
puts r
