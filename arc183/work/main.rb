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


T = STDIN.gets.chomp.to_i




def calc(n, k, first_as, bs)
  pp ['calc', n, k, first_as, bs] if $debug
  first_a_count = first_as.group_by(&:itself).transform_values(&:count)
  b_count = bs.group_by(&:itself).transform_values(&:count)
  pp ['first_a_count', first_a_count] if $debug
  pp ['b_count', b_count] if $debug
  return false unless (first_a_count.keys & b_count.keys).count == b_count.keys.count

  ass = [first_as]
  as_foots = {}
  as_foots[first_as] = true

  while 0 < ass.length
    # pp ass if $debug
    as_nexts = []

    pp ['ass.count', ass.count, 'as_foots.count', as_foots.count] if $debug

    ass.each do |as|
      a_count = as.group_by(&:itself).transform_values(&:count)
  
      (1..n).each do |i|
        # pp ['i', i] if $debug

        js1_ = [1, (i - k)].max
        js1 = (js1_..(i - 1)).to_a

        js2_ = [n, (i + k)].min
        js2 = ((i + 1)..js2_).to_a

        js = js1 + js2
        # pp ['js', js] if $debug
        # pp js if $debug
        js.each do |j|
          next if a_count[as[j - 1]] == 1 && b_count[as[j - 1]] && 0 < b_count[as[j - 1]]

          as_next = as.dup
          as_next[j - 1] = as[i - 1]

          return true if as_next == bs

          next if as_foots[as_next] # 過去に来たパターン

          as_nexts << as_next
          as_foots[as_next] = true
        end          
      end

    end

    ass = as_nexts
  end

  false
end




(1..T).each do |t|
  n, k = STDIN.gets.chomp.split.map(&:to_i)
  as = STDIN.gets.chomp.split.map(&:to_i)
  bs = STDIN.gets.chomp.split.map(&:to_i)

  if $debug
    pp as.group_by(&:itself).transform_values(&:count).sort
    pp bs.group_by(&:itself).transform_values(&:count).sort
  end

  puts calc(n, k, as, bs) ? 'Yes' : 'No'
end



