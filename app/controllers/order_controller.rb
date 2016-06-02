class OrderController < ApplicationController
	@@customer_id=1

	def find(itemnum)
		#check given order present or not 
	end
	def addorder(ordernum , orderamount , ordertype)
		@order_num = ordernum
		@order_amount = orderamount
		@order_type = ordertype
	end

	obj = order.new(101,1000,"Books")
    puts "Customer #{order.customer_id}, amount=$#{obj.order_amount}"
end
