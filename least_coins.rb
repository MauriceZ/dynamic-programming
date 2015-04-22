def least_coins(n, coins)
  coin_quantities = [0]

  1.upto(n) do |amount|
    coin_amounts = []

    coins.each_with_index do |coin, i|
      if amount - coin < 0
        coin_amounts[i] = 9999999
      else
        coin_amounts[i] = coin_quantities[amount - coin]
      end
    end

    coin_quantities[amount] = coin_amounts.min + 1
  end

  coin_quantities[n]
end


coins = [1, 3, 4]

puts least_coins(6, coins)
