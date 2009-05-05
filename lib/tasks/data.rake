namespace :data do
  
  desc "Creates 1000 dummy questions"
  task :questions => :environment do
    0.upto(1000) do |i|
      Question.create(:question => "Question ##{i}", :answer => rand(100) >= 50)
    end
  end
  
end