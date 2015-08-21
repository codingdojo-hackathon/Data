class FirecallsController < ApplicationController

  def new


  	@firecalls = Seattle911.select("seattle911s.incident_type")
  	@total = Seattle911.select("seattle911s.incident_type").count
  	@aidresponse_server = Seattle911.group(:incident_type).count(:incident_number)
  	hash = Hash.new(0)
  	@aidresponse_server.each do |k,v|
  		hash[k] += v
  	end


  	top_ten = hash.max_by(10, &:last).to_h


  	# @aidresponse = Hash.new(0)
  	# @aidresponse = top_ten
  	# @aidresponse["Others"] = 0
  	# @aidresponse_server.each do |k,v|
  	# 	if top_ten.include?("#{k}") == false
  	# 		@aidresponse["Others"] += v
  	# 	end
  	# end

  end

  def index
  	@firecalls = Seattle911.all
  end

  def show

  end

end
