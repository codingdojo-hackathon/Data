require 'soda/client'

class Seattle911 < ActiveRecord::Base

validates :address, :datetime, :latitude, :longitude, presence: true
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
    {"$where" => "datetime >= '#{from}' AND datetime < '#{to}'",
    "$order" => "datetime ASC",
    "$limit" => "50000"})

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

  def self.getallhistory
    month = ["01","02","03","04","05","06","07","08","09","10","11","12"]
    # self.getalldata( '2010-01-01T00:00:00', '2011-01-01T00:00:00')
    # self.getalldata( '2011-01-01T00:00:00', '2012-01-01T00:00:00')
    # self.getalldata( '2012-01-01T00:00:00', '2013-01-01T00:00:00')
    # self.getalldata( '2013-01-01T00:00:00', '2014-01-01T00:00:00')
    for i in 0..10
      self.getalldata( '2014-'+month[i]+'-01T00:00:00', '2014-'+month[i+1]+'-01T00:00:00')
    end
    self.getalldata( '2014-12-01T00:00:00', '2015-01-01T00:00:00')
    for i in 0..6
      self.getalldata( '2015-'+month[i]+'-01T00:00:00', '2015-'+month[i+1]+'-01T00:00:00')
    end
    self.getalldata( '2015-08-01T00:00:00', Time.now.strftime("%FT%T"))
  end

end
