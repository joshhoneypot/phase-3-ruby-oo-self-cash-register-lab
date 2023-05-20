class CashRegister
    attr_reader :discount, :total, :items
  
    def initialize(employee_discount = 0, total = 0.0)
      @discount = employee_discount
      @total = total
      @items = []
    end
  
    def total=(total)
      @total = total
    end
  
    def add_item(title, price, quantity = 1)
      item_total = price * quantity
      @total += item_total
      quantity.times { @items << title }
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
    
    def void_last_transaction
        last_item_price = @items.pop
        @total -= last_item_price
        @total = 0.0 if @items.empty?
    end  
  end
  