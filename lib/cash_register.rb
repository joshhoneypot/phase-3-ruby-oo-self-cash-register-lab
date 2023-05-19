class CashRegister
    attr_reader :discount, :total, :title, :price
    
    def initialize (employee_discount=0, total=0)
        @discount = employee_discount
        @total=total
    end

    def total=(total)
        @total=total
    end

    def add_item(title, price, quantity = 1)
        item_total = price * quantity
        @total += item_total
    end

    def apply_discount
        if @discount > 0
          discount_amount = @total * (@discount.to_f / 100)
          @total -= discount_amount
          "After the discount, the total comes to $#{'%.0f' % @total}."
        else
          "There is no discount to apply."
        end
    end
end