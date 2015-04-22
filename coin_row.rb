def coin_row(coins)
  if coins.length == 1
    return coins.first
  elsif coins.length == 2
    return coins.max
  end
  
  amounts = coins[0..1]

  2.upto(coins.size - 1) do |i|
    amounts[i] = [amounts[0..i-2].max + coins[i], amounts[i-1]].max
  end

  amounts.max
end


coins = [5, 1, 2, 10, 6, 2]

puts coin_row(coins)
