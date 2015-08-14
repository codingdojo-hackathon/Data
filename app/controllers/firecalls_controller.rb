class FirecallsController < ApplicationController
  def new
  	
  end

  def index
  	@firecalls = Seattle911.all 	
  end

  def show
  end
end
