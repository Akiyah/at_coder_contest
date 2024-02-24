N = gets.chomp.to_i

ABXS = (1...N).map do
  gets.chomp.split.map(&:to_i)
end

VS_CALCED = []
VS_CALCING = {}
VS_CALCING_REV = {}

VS_CALCING[1] = 0 # index, cost
VS_CALCING_REV[0] = [1]

def calc
  loop do
    #i, cost = VS_CALCING.to_a.min { |a, b| a[1] <=> b[1] }
    cost = VS_CALCING_REV.keys.min
    i = VS_CALCING_REV[cost].first

    if i == N
      return cost
    end

    a, b, x = ABXS[i - 1]

    unless VS_CALCED[i + 1]
      if VS_CALCING[i + 1]
        if cost + a < VS_CALCING[i + 1]
          VS_CALCING_REV[VS_CALCING[i + 1]].delete(i + 1)
          if VS_CALCING_REV[VS_CALCING[i + 1]].length == 0
            VS_CALCING_REV.delete(VS_CALCING[i + 1])
          end
    
          VS_CALCING[i + 1] = cost + a

          VS_CALCING_REV[VS_CALCING[i + 1]] ||= []
          VS_CALCING_REV[VS_CALCING[i + 1]] << i + 1
        end
      else
        VS_CALCING[i + 1] = cost + a

        VS_CALCING_REV[VS_CALCING[i + 1]] ||= []
        VS_CALCING_REV[VS_CALCING[i + 1]] << i + 1
      end
    end

    unless VS_CALCED[x]
      if VS_CALCING[x]
        if cost + b < VS_CALCING[x]
          VS_CALCING_REV[VS_CALCING[x]].delete(x)
          if VS_CALCING_REV[VS_CALCING[x]].length == 0
            VS_CALCING_REV.delete(VS_CALCING[x])
          end
    
          VS_CALCING[x] = cost + b
  
          VS_CALCING_REV[VS_CALCING[x]] ||= []
          VS_CALCING_REV[VS_CALCING[x]] << x
        end
       else
        VS_CALCING[x] = cost + b

        VS_CALCING_REV[VS_CALCING[x]] ||= []
        VS_CALCING_REV[VS_CALCING[x]] << x
      end
    end

    VS_CALCING.delete(i)
    VS_CALCING_REV[cost].delete(i)
    if VS_CALCING_REV[cost].length == 0
      VS_CALCING_REV.delete(cost)
    end
    VS_CALCED[i] = true
  end
end




puts calc
