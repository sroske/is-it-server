class Scraper < ActiveRecord::Base
  
  belongs_to :question
  
  module Status
    UNKNOWN = 'unknown'
    SUCCEEDED = 'succeeded'
    FAILED = 'failed'
  end
  
  def scrape!
    raise Exception.new("Not yet implemented!")
  end
  
end
