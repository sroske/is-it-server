desc "Runs the scrape! method on every scraper in the database"
task :scrape => :environment do
  count = 0
  fail = 0
  success = 0
  
  Scraper.all.each do |scraper|
    puts "scraping #{scraper.url}"
    
    scraper.scrape!
    puts "result was #{scraper.last_value} with a status of #{scraper.status}"
    
    scraper.status == Scraper::Status::SUCCEEDED ? success += 1 : fail += 1
    count += 1
  end
  
  puts "--------------------------"
  puts "total of #{count} scrapers ran"
  puts "#{fail} failures"
  puts "#{success} successes"
  puts "Done."
end
