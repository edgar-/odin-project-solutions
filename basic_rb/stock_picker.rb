def stock_picker(prices)
    prices_sorted = prices.sort
    i = prices_sorted.length - 1
    dates_profit = []
   
    while i > 0
        (0...i).each do |j|
            if prices.index(prices_sorted[i]) > prices.index(prices_sorted[j])
                profit = prices_sorted[i] - prices_sorted[j]
                dates_profit << [[prices.index(prices_sorted[j]), prices.index(prices_sorted[i])], profit]
            end
        end
        i -= 1
    end
    dates_profit.sort_by! {|dates| dates[1] }
    dates_profit[-1][0]
end
 
prices = [17,3,6,9,15,8,6,1,10]
stock_picker(prices) #=> [1, 4]