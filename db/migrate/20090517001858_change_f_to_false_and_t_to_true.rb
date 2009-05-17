class ChangeFToFalseAndTToTrue < ActiveRecord::Migration
  def self.up
    execute "update questions set answer = 'false' where answer = 'f'"
    execute "update questions set answer = 'true' where answer = 't'"
  end

  def self.down
    execute "update questions set answer = 'f' where answer = 'false'"
    execute "update questions set answer = 't' where answer = 'true'"
  end
end
