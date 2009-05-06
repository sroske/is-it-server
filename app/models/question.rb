class Question < ActiveRecord::Base
  
  module Status
    ACTIVE = 'active'
    DISABLED = 'disabled'
    IMPORT_FAILED = 'import failed'
  end

  named_scope :active, :conditions => { :status => [Status::ACTIVE, Status::IMPORT_FAILED] }
  named_scope :disabled, :conditions => { :status => Status::DISABLED }
  named_scope :flagged, :conditions => ["flag_at >= ? or status = ?", Time.now, Status::IMPORT_FAILED]
  
end
