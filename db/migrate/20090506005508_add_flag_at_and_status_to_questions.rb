class AddFlagAtAndStatusToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :flag_at, :timestamp
    add_column :questions, :status, :string, :default => Question::Status::ACTIVE
  end

  def self.down
    remove_column :questions, :flag_at
    remove_column :questions, :status
  end
end
