
require 'pry'

class CashRegister
    attr_accessor :total, :discount, :last_transaction

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def total= (current_total)
        @total = current_total
    end

    def add_item(item_name, price, quantity=1)
        @last_transaction = quantity*price
        self.total += (quantity*price)
        @total
        quantity.times {@items.push(item_name)}
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        elsif !!@discount
            off = @discount/100.0*@total
            @total = @total - off
            @total
            return "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        if @items.length == 0
            @total = 0
        else
            @total -= @last_transaction
        end
    end

end