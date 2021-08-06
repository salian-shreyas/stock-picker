def stock_picker(stocks)
  start_day = 0
  best_stock = {buy_on: nil, sell_on: nil, profit: 0}

  stocks.each_with_index do |stock, sale_day|
    cur_stock = {buy_on: nil, sell_on: sale_day, profit: 0}

    start_day.upto(sale_day - 1) do |brought_day|
      profit = stocks[sale_day] - stocks[brought_day]

      if profit > cur_stock[:profit]
        cur_stock[:profit] = profit
        cur_stock[:buy_on] = brought_day
      end
    end

    best_stock = cur_stock if cur_stock[:profit] > best_stock[:profit]
  end

  best_stock.values.first(2)
end

stocks = [17, 3, 6, 9, 15, 8, 6, 1, 10]

p stock_picker(stocks)
