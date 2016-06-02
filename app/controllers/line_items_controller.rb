class LineItemsController < ApplicationController
  def item(ordernumber , orderamount , ordertype)
  	@orderno =ordernumber
  	@orderamount=orderamount
  	@ordertype=ordertype
  end

LineItems = LineItemsController.new(101,1500,"Bags")

end
