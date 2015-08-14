class FirecallsController < ApplicationController
  def new
  end

  def index
  	@firecalls = Seattle911.all.limit(2000)

  end

  def show
  end
end
