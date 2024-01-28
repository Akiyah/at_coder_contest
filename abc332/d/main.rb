h, w = gets.split(' ').map(&:to_i)
as = (1..h).map do
  gets.split(' ').map(&:to_i)
end
bs = (1..h).map do
  gets.split(' ').map(&:to_i)
end


def find_ij(as, x)
  as.each_with_index do |row, i|
    j = row.find_index(x)
    if 0 <= j
      return [i, j]
    end
  end
  nil
end

def move(as, ij0, ij1)
  i0, j0 = ij0
  i1, j1 = ij1

  a_row = as[i1]
  as.delete_at(i1)
  as.insert(i0, a_row)

  as.each do |row|
    a_column = row[i1]
    row.delete_at(i1)
    row.insert(i0, a_column)
  end
end


def move_count_0(as, bs)
  x = b[0][0]

  ij = find_ij(as, x)

  return -1 if ij.nil?

   
end

def move_count_column(as, bs)
end

def move_count_row(as, bs)
end

def move_count(as, bs)
  c0 = move_0(as, bs)
  if c0 < 0
    return -1
  end
  
  c1 = move_column(as, bs)
  if c1 < 0
    return -1
  end
  
  c2 = move_row(as, bs)
  if c2 < 0
    return -1
  end
  
  c0 + c1 + c2
end


