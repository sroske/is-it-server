class Question < ActiveRecord::Base
  
  module Status
    ACTIVE = 'active'
    DISABLED = 'disabled'
    IMPORT_FAILED = 'import failed'
  end

  named_scope :active, :conditions => ["(expires_at is null or expires_at >= ?) and status in (?)",
    Time.now, [Status::ACTIVE, Status::IMPORT_FAILED]]
  named_scope :disabled, :conditions => { :status => Status::DISABLED }
  named_scope :flagged, :conditions => ["(flag_at is not null and flag_at >= ?) or status = ?", 
    Time.now, Status::IMPORT_FAILED]
  
end
