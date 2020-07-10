class CashRegister
  attr_accessor :total, :title, :price, :quantity
  @total = 0
  @@items = []
  @@item_prices = []
  
  def initialize(employee_discount = nil)
    @employee_discount = employee_discount
    @total = 0
  end
  
  def discount
    @employee_discount
  end
  
  def add_item(title, price, quantity = 1)
    @title = title
    @price = price
    @quantity = quantity
    @total += price*quantity
  end
  
  def apply_discount
    if @employee_discount != 20
      "There is no discount to apply."
    else
      first = @total * discount/100
    @total = @total - first
    "After the discount, the total comes to $#{@total}."
    end
  end
  
  def items
    add_item(title, price, quantity = 1)
    @quantity.times do 
      @@items << @title
    end
    @@items
  end
  
  def void_last_transaction
    count = @@item_prices.size - 1
    @total - @@item_prices[count]
  end
end