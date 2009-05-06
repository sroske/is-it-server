class CreateScrapers < ActiveRecord::Migration
  def self.up
    create_table :scrapers do |t|
      t.belongs_to :question
      t.string :url
      t.string :xpath
      t.boolean :last_value
      t.timestamp :last_ran_at
      t.string :last_ran_status, :default => Scraper::Status::UNKNOWN
      t.timestamps
    end
  end

  def self.down
    drop_table :scrapers
  end
end
