require 'soda/client'

class CrimesController < ApplicationController

	def index
	    # client = SODA::Client.new({:domain => 'data.seattle.gov'})
	    # @response = client.get("https://data.seattle.gov/resource/e3zj-s4zh.json", {"$where" => "report_year > '1996'"})


	    # # # https://data.seattle.gov/resource/e3zj-s4zh.json
	    # render @response
	end		
end
