f = File.open('input5.txt')
n = f.gets.chomp.to_i
is = f.gets.chomp.split.map(&:to_i)
f.close

f = File.open('expected5.txt')
es = f.gets.chomp.split.map(&:to_i)
f.close

(5240..5250).each do |i|
  f = File.open("input.txt", 'w')
  f.puts(i * 10)
  f.puts(is[-(i * 10)..].join(' '))
  f.close

  command = "ruby main.rb < input.txt"
  actual = `#{command}`

  unless actual.split(' ').map(&:to_i) == es[-(i * 10)..]
    pp [i * 10, 'NG']
    pp ['actual', actual.split(' ').map(&:to_i)[0...10].join(' ')]
    pp ['es', es[-(i * 10)..][0...10].join(' ')]
    pp ['is', is[-(i * 10)..][0...10].join(' ')]
  end
end



