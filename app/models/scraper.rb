require 'open-uri'
require 'hpricot'

class Scraper < ActiveRecord::Base
  
  belongs_to :question
  
  module Status
    UNKNOWN = 'unknown'
    SUCCEEDED = 'succeeded'
    FAILED = 'failed'
  end
  
  def scrape!
    ok = false
    self.last_ran_at = Time.now
    begin
      doc = Hpricot(open(self.url))
      self.last_value = ((doc/self.xpath).html.strip.downcase == 'yes')
      ok = true
    rescue
      ok = false
    end
    if ok
      self.question.update_attributes(:answer => self.last_value)
      self.last_ran_status = Status::SUCCEEDED
    else
      self.last_ran_status = Status::FAILED
    end
    save
  end
  
end
