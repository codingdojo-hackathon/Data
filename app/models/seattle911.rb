require 'soda/client'

class Seattle911 < ActiveRecord::Base

validates :address, :datetime, :latitude, :longitude, :incident_type, presence: true
validates :incident_number, uniqueness: { case_sensitive: false}



  def self.updatedata
    # puts "#{Time.now} - Success"
    curTime = Time.now
    fromTime = curTime - 30*60

    self.getalldata(curTime.strftime("%FT%T"), fromTime.strftime("%FT%T"))
  end

  def self.getalldata(from, to)
    client = SODA::Client.new({:domain => 'data.seattle.gov'})
    response = client.get("grwu-wqtk",
    {"$where" => "datetime > '#{from}' AND datetime < '#{to}'",
    "$order" => "datetime ASC"})

    response.each do |i|
      Seattle911.create(
        address: i.address,
        datetime: i.datetime,
        incident_number: i.incident_number,
        latitude: i.latitude,
        longitude: i.longitude,
        incident_type: i.type)
    end

  end

end
