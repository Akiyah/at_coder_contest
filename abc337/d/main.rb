H, W, K = gets.chomp.split.map(&:to_i)

data0 = (1..H).map do
  gets.chomp
end


def calc(data)
  #pp ['calc', data]

  results = data.map do |line|
    ss = line.split('x').select do |s|
      K <= s.length
    end
    next -1 if ss.length == 0
  
    ss.map do |s|
      l = s.length
      cs = s.split('')
      n = cs[0...K].count('.')
      ns = [n]
      cs[K..-1].each_with_index do |c, i|
        b = cs[i - l]
        n -= 1 if b == '.'
        n += 1 if c == '.'
        ns << n      
      end
      ns.min
    end.min
  end


  #pp ['calc', results]

  results = results.select{ |r| r != -1 }
  results
end

results0 = calc(data0)
#pp results0


data1 = (1..W).map do |i|
  data0.map{ |line| line[i - 1] }.join('')
end

results1 = calc(data1)
#pp results1

results = (results0 + results1)


if results.length == 0
  puts -1
else
  puts results.min
end
