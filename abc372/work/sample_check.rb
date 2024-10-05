
def sample_check(filename)
  command = "ruby main.rb < in/#{filename} > actual/#{filename}"
  `#{command}`

  expected = File.read("out/#{filename}")
  actual = File.read("actual/#{filename}")

  actual == expected
end


Dir.each_child('in').each do |filename|
  puts "filename: #{filename}"
  puts sample_check(filename)
end


