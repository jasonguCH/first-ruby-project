class RestockJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # deserialize the arg into different variable
    product_id = args[0][:product_id]
    store_id = args[0][:store_id]
    quantity = args[0][:quantity]

    @stock = Stock.find_by(product_id: product_id, store_id: store_id)
    unless @stock
      #mock sending of email
      puts "Restock job rejected" + "Stock not found"
    end
    @stock.update(quantity: @stock.quantity + quantity)
    # mock sending of email
    puts "Restock job created" + "Total count of quantity now: " + @stock.quantity.to_s
  end
end
