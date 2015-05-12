desc "Dayrank is called by the Heroku scheduler add-on"
task :dayrank => :environment do
  puts "Recalculating dayrank..."
  day_rank
  puts "Dayrank recalculated."
end