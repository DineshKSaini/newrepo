class WelcomeController < ApplicationController
  def index
  	@time = Time.now
  end
  def  Hello
  	
  	@msg = "Hello TT"
  end

end
