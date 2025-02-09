require "ac-library-rb/dsu"


def test(fi, fa)
  n, m = fi.gets.chomp.split.map(&:to_i)
  abs = (1..m).map do
    fi.gets.chomp.split.map(&:to_i)
  end

  r = fa.gets.chomp.to_i
  iabs = (1..r).map do
    fa.gets.chomp.split.map(&:to_i)
  end

  # pp [n, m, abs, r, iabs]

  dsu = AcLibraryRb::DSU.new(n)
  abs.each do |a, b|
    dsu.merge(a - 1, b - 1)
  end

  # pp dsu.groups
  #vpp({r:, dsu_groups: dsu.groups})
  return false unless dsu.groups.length == r + 1

  abs2 = abs.dup
  iabs.each do |i, a2, b2|
    a, b = abs2[i - 1]
    return false if a2 != a && a2 != b

    if a2 == a
      abs2[i - 1] = [b2, b]
    else
      abs2[i - 1] = [a, b2]
    end
  end

  dsu2 = AcLibraryRb::DSU.new(n)
  abs2.each do |a, b|
    dsu2.merge(a - 1, b - 1)
  end

  # pp({dsu2_groups: dsu2.groups})
  return false unless dsu2.groups.length == 1

  true
end




def check(is)
  is = (1..) if is.empty?
  is.each do |i|
    input_file = "test/sample-#{i}.in"
    actual_file = "test/sample-#{i}.actual"

    return unless File.exist?(input_file)

    command = "ruby main.rb < #{input_file} > #{actual_file}"
    pp command
    `#{command}`

    File.open(input_file) do |fi|
      File.open(actual_file) do |fa|
        if test(fi, fa)
          pp 'OK'
        else
          pp 'NG'
        end
      end
    end
  end
end

check(ARGV)


