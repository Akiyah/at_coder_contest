#!/usr/bin/env ruby
def create_input(h, w)
  as = h.times.map do
    w.times.map { rand(10 ** 3 - 1) + 1 }
  end
  ps = (h + w - 1).times.map { rand(10 ** 3 - 1) + 1 }

  [h, w, as, ps]
end

def create_input_file(h, w, as, ps, filename)
  File.open(filename, 'w') do |f|
    f.puts [h, w].join(' ')
    as.each do |rows|
      f.puts rows.join(' ')
    end
    f.puts ps.join(' ')
  end
end


def test
  filename_input = 'test/random.in'
  filename_output_1 = 'test/random_1.out'
  filename_output_2 = 'test/random_2.out'
  h, w, as, ps = create_input(4, 4)
  create_input_file(h, w, as, ps, filename_input)

  `ruby main.rb < #{filename_input} > #{filename_output_1}`
  `ruby main_tle.rb < #{filename_input} > #{filename_output_2}`

  r = `diff #{filename_output_1} #{filename_output_2}`
  r.length == 0
end


1000.times do |i|
  pp(i:)
  break unless test
end

