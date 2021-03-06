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
      self.last_value = (eval(self.xpath).strip.downcase == 'yes') rescue false
      ok = true
    rescue
      ok = false
    end
    if ok
      self.question.update_attributes(:answer => self.last_value.to_s)
      self.last_ran_status = Status::SUCCEEDED
    else
      self.last_ran_status = Status::FAILED
    end
    save
  end
  
end
