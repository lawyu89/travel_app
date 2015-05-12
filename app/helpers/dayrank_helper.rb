module DayrankHelper
  def day_rank
    attractions = Attraction.all
    if Time.now.hour == 1
      attractions.each do |attra|
        attra.popularity = 0
      end
    end

    attractions.each do |attra|
      likes = attra.user_attractions.where(preferences: true).length.to_f
      dislikes = attra.user_attractions.where(preferences: false).length.to_f
      attra.popularity = likes/dislikes
    end
  end
end

=begin
#install heroku scheduler (from terminal):
heroku addons:create scheduler:standard

#lib/tasks/scheduler.rake
desc "Dayrank is called by the Heroku scheduler add-on"
task :dayrank => :environment do
  puts "Recalculating dayrank..."
  day_rank
  puts "Dayrank recalculated."
end

=end

#Not using Cronjobs anymore.  Below is kept in case we fall back to Cronjobs.
#CRONJOB: 00 00 * * * ruby /app/helpers/dayrank_helper.rb
