puts 300000

(1..100).each do |c|
  (1..3000).each do |d|
    puts [c, d].join(' ')
  end
end
