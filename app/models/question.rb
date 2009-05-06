class Question < ActiveRecord::Base
  
  has_one :scraper
  
  module Status
    ACTIVE = 'active'
    DISABLED = 'disabled'
  end

  named_scope :active, :conditions => ["(expires_at is null or expires_at >= ?) and status in (?)", Time.now, Status::ACTIVE]
  named_scope :disabled, :conditions => { :status => Status::DISABLED }
  named_scope :flagged, :conditions => ["(flag_at is not null and flag_at <= ?) or scrapers.last_ran_status = ?", 
    Time.now, Scraper::Status::FAILED], :include => [:scraper]
  
end
