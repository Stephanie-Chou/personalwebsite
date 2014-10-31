def profit(prices)
	i = 0
	max_profit = 0
	min = prices[i]

	buy_price = 0
	sell_price = 0
	while i < prices.length
		curr = prices[i]
		# p curr-min
		if curr-min > max_profit
			max_profit = curr-min 
			buy_price = min
			sell_price = curr
		end
		min = curr if curr < min
		i +=1
	end
	p "Buy Price: $#{buy_price} Sell Price: $#{sell_price} Profit: $#{max_profit}"
	return max_profit
end


p prices = Array.new(30) { rand(100) }
p profit(prices)

O(n)