n = gets.chomp.to_i

uvs = (1..(n-1)).map do
  gets.chomp.split(' ').map(&:to_i)
end


def count(uvs, from, current)
  # pp ['count', from, current]
  edges = uvs.select { |uv| uv[0] == current || uv[1] == current }
  if edges.length <= 1
    return 1
  end

  # pp "edges"
  # pp edges

  result = edges.map do |edge|
    if edge.sort == [from, current].sort
      nil
    else
      n = (edge[0] == current ? edge[1] : edge[0])
      count(uvs, current, n)
    end
  end
  1 + result.compact.sum
end

def count_one(uvs)
  # pp 'count_one'
  edges = uvs.select { |uv| uv[0] == 1 || uv[1] == 1 }
  if edges.length <= 1
    return 1
  end

  result = edges.map do |edge|
    n = (edge[0] == 1 ? edge[1] : edge[0])

    # pp ["call count", 1, n]
    count(uvs, 1, n)
  end
  1 + result.sort[0...-1].sum
end

puts count_one(uvs)
