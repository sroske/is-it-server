class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :question
      t.boolean :answer
      t.timestamp :expires_at
      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
