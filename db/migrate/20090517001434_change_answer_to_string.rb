class ChangeAnswerToString < ActiveRecord::Migration
  def self.up
    change_column :questions, :answer, :string
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration, "What has happened, happened"
  end
end
