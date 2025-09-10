#!/usr/bin/env ruby

def check_one(input_file_name)
  pp(input_file_name:)
  command_main =  "ruby main.rb < #{input_file_name}"

  result = `#{command_main}`
  pp(result:)
  if result.chomp == 'No'
    puts result
  else # yes
    a, b, c = result.split(' ').map(&:to_i)
    fs = File.readlines(input_file_name)
    n = fs[0].to_i
    r = 0
    n.times do |i|
      x, y = fs[i + 1].split(' ').map(&:to_i)
      r += 1 if a * x + b * y + c == 0
    end
    if n < r * 2
      pp(r:, result: 'OK')
    else
      pp(r:, result: 'NG')
    end
  end
end

def check(dir, selected_input_file_names)
  pp(dir:, selected_input_file_names:)
  Dir.glob(dir + '/' + '*.in') do |input_file_name|
    if selected_input_file_names.length == 0 || selected_input_file_names.include?(input_file_name)
      check_one(input_file_name)
    end
  end
end

check('test', ARGV)
