#!/usr/bin/env ruby


require 'prime'

class Prime
  def pds(n)
    pd = prime_division(n)

    ps = pd.map { |p, m| p }
    rs = pd.map { |p, m| (0..m).to_a }

    [nil].product(*rs) do |ms|
      pd = ps.zip(ms[1..])
      m = int_from_prime_division(pd)
      n_m = n / m
      yield(m, n_m, pd)
    end
  end
end

# rs = []
# Prime.pds(2250) { |m, n_m, pd| rs << [m, n_m, pd] }

# pp rs.sort_by{ |m, n_m, pd| m }


rs = []
Prime.pds(2 * 3 ** 2 * 5 ** 3) { |m, n_m, pd| rs << [m, n_m, pd] }

pp rs.sort_by{ |m, n_m, pd| m }



rs = []
Prime.pds(4999) { |m, n_m, pd| rs << [m, n_m, pd] }

pp rs.sort_by{ |m, n_m, pd| m }
