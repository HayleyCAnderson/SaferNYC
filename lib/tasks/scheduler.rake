desc "This task is called by the Heroku scheduler add-on"
task :update_data => :environment do
  puts "Updating data..."
  NypdCollisionData.new.get_incidents
  puts "Data updated."
end

desc "This task is called by the Heroku scheduler add-on"
task :delete_data => :environment do
  puts "Deleting old data..."
  DataDeleter.new.delete_old_data
  puts "Old data deleted."
end
