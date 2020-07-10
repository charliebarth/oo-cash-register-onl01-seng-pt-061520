class CashRegister
  attr_accessor :total
  @total = 0
  @@items = []
  @@item_prices = []
  
  def initialize(employee_discount = nil)
    @employee_discount = employee_discount
    @total = 0
    @@items.clear
    @@item_prices.clear
  end
  
  def discount
    @employee_discount
  end
  
  def add_item(title, price, quantity = 1)
    quantity.times do
      @@items << title
      @@item_prices << price
    end
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
    @@items
  end
  
  def void_last_transaction
    count = @@item_prices.size - 1
    puts @@item_prices[count]
    @total - @@item_prices[count]
  end
end
cash_register = CashRegister.new
cash_register.add_item("apple", 0.99)
cash_register.add_item("tomato", 1.76)
cash_register.void_last_transaction