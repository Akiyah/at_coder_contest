n = gets.chomp.to_i

uvs = (1..(n-1)).map do
  gets.chomp.split(' ').map(&:to_i)
end

data = {}
uvs.each do |uv|
  data[uv[0]] ||= []
  data[uv[1]] ||= []
  data[uv[0]] << uv[1]
  data[uv[1]] << uv[0]
end

def count(data, from, current)
  # pp ['count', from, current]
  if data[current].length <= 1
    return 1
  end

  # pp "edges"
  # pp edges

  result = data[current].map do |v|
    if v == from
      nil
    else
      count(data, current, v)
    end
  end
  1 + result.compact.sum
end

def count_one(data)
  # pp 'count_one'
  if data[1].length <= 1
    return 1
  end

  result = data[1].map do |v|
    count(data, 1, v)
  end
  1 + result.sort[0...-1].sum
end

puts count_one(data)
